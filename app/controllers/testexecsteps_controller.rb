class TestexecstepsController < ApplicationController
  before_action :authenticate_user!
  helper_method :itemtest_for_order

  def update
    logger.debug "update start"
    @testexecstep = Testexecstep.find(params[:id])

    @itemtest = @testexecstep.itemtest
    # Нашли следующий невыполненный вопрос
    @testexecstep_next = testexecstep_next(@testexecstep)
    @testexec = @testexecstep.testexec

    @testexecstep.datefinish = Time.now
    dur = @testexecstep.datefinish.to_i - @testexecstep.laststart.to_i
    logger.debug "@testexecstep.duration=#{dur}"
    # Увеличили время вопроса в сек
    @testexecstep.duration = @testexecstep.duration + dur
    # Если время выполнения теста не истекло, продолжаем
    if !@testexec.use_timelimit || @testexec.timeleft > dur
      # Уменьшили продолжительность теста на продолжительность последнего запроса
      if @testexec.use_timelimit
        @testexec.timeleft = @testexec.timeleft - dur
      end
      @testexecstep.ratio = 0
      @testexecstep.response = params[:response]
      logger.debug "@params=#{params}"

      # Для множественного выбора 
      if @itemtest.response_is_checkbox
        r = ''
        @itemtest.responses.sort_by { |p| p.id }.each do |response|
          n = 'r_'+String(response.id)
          if params[n]
            r = r + (r != '' ? ',' : '') + params[n]
          end
        end
        @testexecstep.response = r
      else
        # Почемуто ответ иногда во вложенном объекте!
        if params[:testexecstep]
          testexecstep_p = params[:testexecstep]
          #logger.debug "@testexecstep.response=#{testexecstep_p}"
          #logger.debug "@testexecstep.response1=#{testexecstep_p[:response]}"
          if testexecstep_p
            @testexecstep.response = String(testexecstep_p[:response])
          end
        end
      end
      #logger.debug "@testexecstep.response=#{String(params[:testexecstep])}"

      # Проверить на правильность ответа
      if @itemtest.test_response(@testexecstep.response)
        @testexecstep.ratio = @itemtest.ratio
      end

      @is_end_test = false
      # Проверить не последний это тест
      if @testexecstep_next
        @testexec.ordernum = @testexecstep_next.ordernum
      else
        @is_end_test = true
        @testexec.datefinish = Time.now
      end  

      logger.debug "update params=#{params} "
      #logger.debug "update @testexecstep_next=#{@testexecstep_next.ordernum} "
      #logger.debug "update @itemtest.responsetype.id=#{@itemtest.responsetype.id} "
      #logger.debug "update @testexe=#{@testexec.id} "
      #logger.debug "update @testexecstep.ratio=#{@testexecstep.ratio} "

      if @testexecstep.save
        if @is_end_test
          @testexec.save
          redirect_to testexec_path(@testexec.id)
        else
          @testexec.save
          # Если следующий тест еще не выполнялся, установить дату начала
          if !@testexecstep_next.datestart
            @testexecstep_next.datestart = Time.now
          end
          # Установить дату начала последнего выполнения и увеличить счетчик выполнений
          @testexecstep_next.laststart = Time.now
          @testexecstep_next.countexec = @testexecstep_next.countexec + 1
          @testexecstep_next.save
          # перейти на следующий тест
          redirect_to edit_testexecstep_path(@testexecstep_next.id)
        end
      else
        render "update"
      end
    else # Выполнение теста прервано по истечению времени
      @testexec.timeleft = 0
      @testexec.datefinish = Time.now
      
      @testexec.save
      @testexecstep.save
      redirect_to testexec_path(@testexec.id)
    end
  end

  def edit
    @testexecstep=Testexecstep.find(params[:id])
  end

  def nexttime
    logger.debug "nexttime parms = #{params} "
  end

  def itemtest_for_order(testexecstep) 
    testexec = testexecstep.testexec
    if !testexec
      testexec = Testexec.find(params[:testexec_id])
    end
    #logger.debug "itemtest_for_order ordernum = #{@testexec.ordernum} "
    itemtest = testexec.onetest.itemtests.find {|i| i.ordernum == testexec.ordernum} 
    #logger.debug "itemtest_for_order @itemtest = #{@itemtest.title} "
    itemtest
  end

  def testexecstep_next(testexecstep) 
    testexec = testexecstep.testexec
    testexecsteps = testexec.testexecsteps.sort_by { |p| p.ordernum }
    testexecsteps.find {|i| i.ordernum > testexec.ordernum and i.datefinish.blank?} 
  end

  def itemtest_next(testexecstep) 
    testexec = testexecstep.testexec
    if !testexec
      testexec = Testexec.find(params[:testexec_id])
    end
    #logger.debug "itemtest_for_order ordernum = #{@testexec.ordernum} "
    itemtest = testexec.onetest.itemtests.find {|i| i.ordernum == testexec.ordernum+1} 
    #logger.debug "itemtest_for_order @itemtest = #{@itemtest.title} "
    itemtest
  end

  private
  def testexecstep_params
    params.permit( :testexec_id, :datestart, :datefinish, :itemtest_id, :response, :ratio, :duration, :ordernum, :countexec, :laststart )
  end

  def testexec_params
    params.permit(:onetest_id, :datestart, :datefinish, :user_id, :ordernum, :timelimit, :enskipstep, :countexec, :laststart )
  end
end

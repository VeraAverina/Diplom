class TestexecsController < ApplicationController
  before_action :authenticate_user!

  # Создать все записи Testexecsteps связанные с текущим прохождением теста
  def fill_empty_steps(testexec)
    itemtests = testexec.onetest.itemtests.sort_by { |p| p.ordernum }
    itemtests.each do |itemtest|
      testexecstep = Testexecstep.new
      testexecstep.testexec_id = testexec.id
      testexecstep.itemtest_id = itemtest.id
      testexecstep.ordernum = itemtest.ordernum
      testexecstep.duration = 0
      testexecstep.countexec = 0
      testexecstep.save
    end
  end

  def update
    @testexec=Testexec.find(params[:id])
    if !@testexec.datestart
      @testexec.datestart = Time.now
      @testexec.ordernum = 1
      if @testexec.timelimit
        @testexec.timeleft = @testexec.timelimit * 60 
      end
      fill_empty_steps(@testexec)
    end
    
    if @testexec.update(testexec_params)
      @testexecstep = testexecstep_for_order(@testexec) 
      @itemtest = @testexecstep.itemtest
      if !@testexecstep.datestart
        @testexecstep.datestart = Time.now
        @testexecstep.laststart = Time.now
        @testexecstep.countexec = @testexecstep.countexec + 1
        @testexecstep.save
      end
      #logger.debug "@testexecstep id=#{@testexecstep.id} "
      #logger.debug "@itemtest id=#{@itemtest.id} "
      redirect_to edit_testexecstep_path(@testexecstep.id)
      #redirect_to new_testexecstep_path(:testexec_id => @testexec.id, :datestart => Time.now, :ordernum => @itemtest.ordernum)
      #new_testexecstep_path
    end
  end

  def new
    @testexec=Testexec.new
  end

  def create
    @testexec = Testexec.new(testexec_params)
    @testexec.teacheruser_id = current_user.id
    logger.debug "@testexec user_id=#{@testexec.user_id}"
    logger.debug "@testexec teacheruser_id=#{@testexec.teacheruser_id}"
    logger.debug "@testexec onetest_id=#{@testexec.onetest_id}"
    if @testexec.save
      redirect_to testexecs_path, notice: "The file has been uploaded."
    else
      render "new"
    end
  end

  def edit
    @testexec=Testexec.find(params[:id])
  end

  def index
    @testexecs=Testexec.all.filter { |testexec| testexec.user_id == current_user.id }
  end

  def show
    @testexec=Testexec.find(params[:id])
    # Заполнить поля статистика после окончания последнего вопроса
    @testexec.fill_statistic_params
  end
  
private
  def testexec_params
    logger.debug "@testexec params=#{params}"
    if params[:testexec]
      params.require(:testexec).permit(:onetest_id, :datestart, :datefinish, :user_id, :ordernum, :timelimit, :enskipstep, :teacheruser_id, :notexec, :timeleft)
    else
      params.permit(:onetest_id, :datestart, :datefinish, :user_id, :ordernum, :timelimit, :enskipstep, :teacheruser_id, :notexec, :timeleft)
    end
  end

  def itemtest_for_order(testexec) 
    testexecsteps = testexec.testexecsteps.find {|i| i.ordernum == testexec.ordernum} 
    testexecsteps ? testexecsteps.itemtest : nil
  end

  def testexecstep_for_order(testexec) 
    testexec.testexecsteps.find {|i| i.ordernum == testexec.ordernum} 
  end

  def itemtest_next(testexecstep) 
    testexec = testexecstep.testexec
    testexecsteps = testexec.testexecsteps.find {|i| i.ordernum > @testexec.ordernum and i.datefinish.blank?} 
    testexecsteps ? testexecsteps.itemtest : nil
  end

  

end

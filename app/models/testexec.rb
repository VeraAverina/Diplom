class Testexec < ApplicationRecord
  belongs_to :onetest
  belongs_to :user
  #belongs_to :teacheruser

  has_many :testexecsteps

  def use_timelimit 
    timelimit and timelimit > 0
  end

  # получить количество всех вопросов
  def steps_all_size
    testexecsteps.size
  end

  def stat_not_execute_count
    testexecsteps.filter { |testexecstep| !testexecstep.ratio }
    .size
  end

  # получить выполненые задания
  def stat_ok_count
    testexecsteps.filter do |testexecstep|
      testexecstep.ratio && testexecstep.ratio > 0
    end
    .size
  end

  def stat_skip_count
    0
  end

  def stat_error_count
    testexecsteps.filter do |testexecstep|
      testexecstep.ratio && testexecstep.ratio == 0
    end
    .size
  end

  def stat_ratio
    result = 0
    testexecsteps.each do |testexecstep|
      if testexecstep.ratio && testexecstep.ratio > 0
        result += testexecstep.ratio
      end
    end
    result
  end

  def stat_assessment
    ratio = stat_ratio
    if ratio >= onetest.ratio5 
      5
    elsif ratio >= onetest.ratio4
      4 
    elsif ratio >= onetest.ratio3
      3
    else 
      2
    end
  end

  # получить выполненые задания
  def steps_executed
    testexecsteps.filter do |testexecsteps|
      !testexecsteps.datefinish
    end
  end

  # получить пропущенные задания
  def steps_skiped
    testexecsteps.filter do |testexecsteps|
      testexecsteps.datestart and !testexecsteps.datefinish
    end
  end

  # получить не выполненные задания
  def steps_left
    testexecsteps.filter do |testexecsteps|
      !testexecsteps.response
    end
  end

  # выполнен тест или нет
  def is_executed
    #left = steps_left
    #left.size == 0
    self.datefinish != nil
  end

  # Заполнить поля статистика после окончания последнего вопроса
  def fill_statistic_params
    if !self.responseall
      self.responseall = steps_all_size
      self.responseok = stat_ok_count
      self.responseerror = stat_error_count
      self.ratio = stat_ratio
      self.assessment = stat_assessment
      self.responseskip = stat_skip_count
      self.notexec = stat_not_execute_count

      save
    end
  end

  # получить количество всех вопросов
  def for_teacher
    Testexec.all.filter { |t| t.teacheruser_id == current_user.id }
  end

end


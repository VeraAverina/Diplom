class User < ApplicationRecord
  has_many :resultfiles
  has_many :testexecs
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def to_s
    self.email + (self.surname == "" ? "" : " (" + self.surname + ")")
  end

  def tests_for_teacher
    #logger.debug "user.teacher=#{teacher}"
    #logger.debug "user.id=#{id}"
    if is_teacher
      Testexec.all.filter { |testexec| testexec.teacheruser_id == id }
      .sort_by { |p| p.datestart ? p.datestart : p.created_at }.reverse 
    else
      nil
    end
  end

  def is_teacher
    teacher=="Teacher"
  end

  def is_student
    teacher=="Student"
  end
end

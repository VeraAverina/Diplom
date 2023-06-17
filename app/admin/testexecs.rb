ActiveAdmin.register Testexec do
  #menu parent: "Выполнение тестов", label: "Выполнение одиного теста"
  menu label: "Выполнение тестов"

  permit_params :onetest_id, :datestart, :datefinish, :user_id, :ordernum, :timelimit, :enskipstep, :assessment, :ratio, :teacheruser_id, :resposeall, :resposeok, :resposeerror, :resposeskip

  filter :onetest, label: 'Тест'
  filter :datestart, label: 'Дата начала'
  filter :datefinish, label: 'Дата окончания'
  filter :user, label: 'Тестируемый'
  filter :teacheruser, label: 'Преподаватель'
  filter :timelimit, label: 'Ограничение по времени'
  filter :enskipstep, label: 'Разрешить пропуск вопросов'

  index do
    column "Тест", :onetest
    column "Преподаватель", :teacheruser
    column "Тестируемый", :user
    column "Ограничение по времени", :timelimit
    column "Разрешить пропуск вопросов", :enskipstep
    column "Дата начала", :datestart
    column "Дата окончания", :datefinish
    column "Порядок текущего вопроса", :ordernum
    actions
  end

  form title: 'Тест' do |f|
    inputs 'Основные' do
      div do
        columns do
          column max_width: "100px", min_width: "80px" do span "Тест " end
          column do input :onetest, label: false end
          column max_width: "100px", min_width: "80px" do span "Преподаватель " end
          column do input :teacheruser_id, label: false end
          column max_width: "100px", min_width: "80px" do span "Тестируемый" end
          column span: 2 do input :user, label: false end
          column max_width: "100px", min_width: "80px" do span "Порядок текущего вопроса" end
          column do input :ordernum, label: false end
        end
        columns do
          column max_width: "100px", min_width: "80px" do span "Ограничение по времени в минутах (обязательно)" end
          column do input :timelimit, label: false end
          column max_width: "100px", min_width: "80px" do span "Разрешить пропуск вопросов" end
          column do input :enskipstep, label: false end #, as: :check_boxes, collection: en
        end
        #columns do
        #  column max_width: "100px", min_width: "80px" do span "Дата начала" end
        #  column do input :datestart, label: false end
        #  column max_width: "100px", min_width: "80px" do span "Дата окончания" end
        #  column do input :datefinish, label: false end
        #  column max_width: "100px", min_width: "80px" do span "Текущий вопрос" end
        #  column do input :itemtest, label: false end
        #end
      end
    end

    panel 'Вопросы' do
    end

    actions
  end

end

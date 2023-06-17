ActiveAdmin.register Testexecstep do

  #menu parent: "Выполнение тестов", label: "Выполнение одиного вопроса"
  # Отключить меню. Доступ только через "Выполнение тестов"
  menu false

  permit_params :testexec_id, :datestart, :datefinish, :itemtest_id, :duration

  filter :testexec, label: 'Тест'
  filter :itemtest, label: 'Вопрос'
  filter :datestart, label: 'Дата начала'
  filter :datefinish, label: 'Дата окончания'
  
end

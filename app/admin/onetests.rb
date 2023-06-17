ActiveAdmin.register Onetest do
  
  #menu parent: "Дизайнер тестов", label: "Один тест"
  menu label: "Дизайнер тестов"

  config.sort_order = 'title_asc'
  permit_params :title, :discipline_id, :ratio5, :ratio4, :ratio3, :ratio2,
                 itemtests_attributes: [:id, :title, :ordernum, :ratio, :responsetype_id, :_destroy, :_create, :_update]

  filter :title, label: 'Название теста'
  filter :discipline_id, label: 'Дисциплина'

  def question_small(itemtest)
    itemtest.questions.size > 0 ? itemtest.questions.first.body : "*** НЕТ ВОПРОСА ****"
  end

  index do
    column "Название теста", :title
    column "Дисциплина", :discipline
    column "На 5", :ratio5
    column "На 4", :ratio4
    column "На 3", :ratio3
    column "На 2", :ratio2

    #column :itemtests do |onetest|
    #  onetest.itemtests.map(&:title).join(', ')
    #end
    actions
  end

  show do
    attributes_table do
      row  :title
    end

    panel 'Вопрос теста' do
      table_for onetest.itemtests do
        column :title
        column :ordernum
        column :ratio
      end
    end
  end

  form title: 'Один тест' do |f|
    f.inputs 'Основные' do
      f.input :title, label: "Название всего теста"
      f.input :discipline, label: "Дисциплина"
      columns do
        column do f.input :ratio5, label: "Баллов на 5  " end
        column do f.input :ratio4, label: "Баллов на 4  " end
        column do f.input :ratio3, label: "Баллов на 3  " end  
        column do f.input :ratio2, label: "Баллов на 2  " end  
      end
    end

    panel 'Вопросы' do
      table_for onetest.itemtests.order('ordernum asc') do 
        column "Название вопроса теста", :title
        column "Вопрос теста" do |itemtest|
           itemtest.questions.size > 0 ? itemtest.questions.first.body : "*** НЕТ ВОПРОСА ****"
        end
        column "Значение упорядочивания", :ordernum
        column "Баллы", :ratio
        column "Тэг", :tagtest
        column("Действия") do |itemtest| 
          span link_to "View", admin_itemtest_path(itemtest) 
          span link_to "Edit", edit_admin_itemtest_path(itemtest) 
          span link_to "Delete", admin_itemtest_path(itemtest), method: :delete, data: { confirm: I18n.t('active_admin.delete_confirmation') }
        end
      end

      if resource.persisted?
        actions defaults: true do |i|
          link_to "Добавить вопрос", new_admin_itemtest_path(
            :itemtest => { :onetest_id => onetest.id, :responsetype_id => 1, :ratio => 5, :ordernum => onetest.itemtest_order_next }
          )
        end
      end
    end

    actions
  end

  # Контролер тоже не надо отдельно делать прям здесь
  controller do

    after_create do |onetest|
      @last_id = onetest.id
    end

    def create
      create! do |success, failure|
        if @last_id
          success.html { redirect_to edit_admin_onetest_url(@last_id) }
        else
          success.html { redirect_to admin_onetests_url }
        end
      end
    end 
    
    def update
      logger.debug "update params=#{params} "
      update! { admin_onetests_url }
    end 

    def destroy
      destroy! { admin_onetests_url }
    end 

  end
end

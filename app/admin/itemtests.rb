ActiveAdmin.register Itemtest do
  #belongs_to :onetest
  #menu parent: "Дизайнер тестов", label: "Одно задание в тесте"
  # Отключить меню. Доступ только через "Дизайнер тестов"
  menu false

  config.sort_order = 'ordernum_asc'
  permit_params :ordernum, :ratio, :onetest_id, :responsetype_id, :title, :tagtest #, :responseright_ids[]

  filter :title, label: 'Имя теста'
  filter :responsetype_id, label: 'Тип теста'

  # Форма View
  index do
    column "Тест", :onetest
    column "Имя теста", :title
    column "Тип теста", :responsetype
    column "Баллы за тест", :ratio
    #column "Тэг", :tagtest
    column "Порядок", :ordernum
    actions
  end

  # Форма View, по умолчанию 
  show do
    panel "Вопрос" do
      attributes_table_for itemtest do
        itemtest.questions.each do |question|
          text_node question.body
        end
      end
    end
    panel "Ответы" do
      attributes_table_for itemtest do
        itemtest.responses.each do |response|
          text_node response.body
        end
      end
    end
  end

  # Форма Create, Edit
  form title: 'Тест' do |f|
    inputs 'Основные' do
      div do
        columns do
          column max_width: "100px", min_width: "80px" do span "Родительский тест " end
          column do input :onetest, label: false  end #, input_html: { disabled: true }
          column max_width: "100px", min_width: "80px" do span "Название вопроса" end
          column span: 2 do input :title, label: false end
          column max_width: "100px", min_width: "80px" do span "Баллы за тест" end
          column do input :ratio, label: false end
        end
        columns do
          column max_width: "100px", min_width: "80px" do span "Тип теста" end
          column do input :responsetype, label: false end
          column max_width: "100px", min_width: "80px" do span "Порядок" end
          column do input :ordernum, label: false end
          #column max_width: "100px", min_width: "80px" do span "Тэг" end
          #column do input :tagtest, label: false end
        end
      end
    end
    panel 'Вопрос' do
      table_for itemtest.questions do
        column "Текст", :body
        column "Порядок", :ordernum
        column("Действия") do |paragraphtest| 
          span link_to "View", admin_paragraphtest_path(paragraphtest) 
          span link_to "Edit", edit_admin_paragraphtest_path(paragraphtest) 
          span link_to "Delete", admin_paragraphtest_path(paragraphtest), method: :delete, data: { confirm: I18n.t('active_admin.delete_confirmation') }
        end
      end

      if resource.persisted?
        actions defaults: true do |p|
          link_to "Добавить абзац вопроса", new_admin_paragraphtest_path(
            :paragraphtest => { :itemtest_id => itemtest.id, :paragraphtype_id => 2, :posimage_id => 1, :ordernum => itemtest.questions_order_next }
          )
        end
      end
    end

    panel 'Ответы' do
      table_for itemtest.responses do
        column "Текст", :body
        column "Порядок", :ordernum
        column("Действия") do |paragraphtest| 
          span link_to "View", admin_paragraphtest_path(paragraphtest) 
          span link_to "Edit", edit_admin_paragraphtest_path(paragraphtest) 
          if itemtest.responses.size > 1 and itemtest.responsetype_id != 4
            span link_to "Delete", admin_paragraphtest_path(paragraphtest), method: :delete, data: { confirm: I18n.t('active_admin.delete_confirmation') }
          end
        end
      end

      if resource.persisted?
        actions defaults: true do |i|
          if itemtest.responses.size == 0 or itemtest.responsetype_id != 4
            link_to "Добавить ответ", new_admin_paragraphtest_path(
              :paragraphtest => { :itemtest_id => itemtest, :paragraphtype_id => 3, :posimage_id => 1, :ordernum => itemtest.responses_order_next }
            )
          end
        end
      end

      table_for itemtest.responserights do
        if(itemtest.responsetype_id == 1 or itemtest.responsetype_id == 2)
          column("Правильный ответ") do  |responseright|  
            right_responses = itemtest.right_responses(responseright)
            if right_responses
              right_responses.first.body
            else
              "Нет ответа"
            end  
          end
        else
          column "Правильный ответ", :response
        end
        column("Действия") do |responseright| 
          span link_to "Edit", edit_admin_responseright_path(responseright)
        end
      end

      if resource.persisted? 
        if( itemtest.responserights_size == 0 or itemtest.responsetype_id == 2 or itemtest.responsetype_id == 3 )
          actions defaults: true do |i|
            link_to "Добавить ответ", new_admin_responseright_path(
              :responseright => { :itemtest_id => itemtest }
            )
          end  
        end
      end
    end

    f.actions do
      f.action :submit
      f.cancel_link({controller: :onetests, action: :edit, id: itemtest.onetest.id })
    end
  end  

  # Контролер тоже не надо отдельно делать прям здесь
  controller do

    after_create do |itemtest|
      logger.debug "after_create itemtest.id=#{itemtest.id} "
      @after_create_id = itemtest.id
    end

    def create
      create! do |success, failure|
        if @after_create_id
          success.html { redirect_to edit_admin_itemtest_url(@after_create_id) }
        else
          success.html { edit_admin_onetest_url( resource.onetest_id ) }
        end
      end
    end 
    
    def update
      @itemtest = Itemtest.find(params[:id])
      update! { edit_admin_onetest_url( @itemtest.onetest_id ) }
    end 

    def destroy
      @itemtest = Itemtest.find(params[:id])
      destroy! { edit_admin_onetest_url( @itemtest.onetest_id ) }
    end 

  end

end


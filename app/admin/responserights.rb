ActiveAdmin.register Responseright do
  #menu parent: "Дизайнер тестов", label: "Правильные ответы"
  # Отключить меню. Доступ только через "Дизайнер тестов"
  menu false

  permit_params :itemtest_id, :response

  index do
    column "Вопрос" do |responseright| 
      responseright.itemtest.title_full
    end
    #if(responseright.itemtest.responsetype_id == 1 or responseright.itemtest.responsetype_id == 2)
    #  column "Правильный ответ sel", :response
    #else
      column "Правильный ответ", :response
    #end
    actions
  end

  form title: 'Тест' do |f|
    inputs 'Основные' do
      div do
        columns do
          column max_width: "100px", min_width: "80px" do span "Ответ к вопросу " end
          column do input :itemtest, label: false end #, input_html: { disabled: true }
          column max_width: "100px", min_width: "80px" do span "правильный ответ" end
          if(responseright.itemtest.responsetype_id == 1 || responseright.itemtest.responsetype_id == 2)
            column do input :response, label: false, as: :select, collection: responseright.itemtest.responses end
          else
            column do input :response, label: false end
          end
        end
      end
    end

    f.actions do
      f.action :submit
      f.cancel_link({controller: :itemtests, action: :edit, id: responseright.itemtest.id })
    end
  end

  controller do

    def create
      create! { edit_admin_itemtest_url( resource.itemtest_id ) }
    end 
    
    def update
      @responseright = Responseright.find(params[:id])
      update! { edit_admin_itemtest_url( @responseright.itemtest_id ) }
    end 

    def destroy
      @responseright = Responseright.find(params[:id])
      destroy! { edit_admin_itemtest_url( @responseright.itemtest_id ) }
    end 

  end
end

ActiveAdmin.register Paragraphtest do
  #menu parent: "Дизайнер тестов", label: "Абзац"
  # Отключить меню. Доступ только через "Дизайнер тестов"
  menu false


    permit_params :ordernum, :body, :image, :itemtest_id, :posimage_id, :paragraphtype_id
    config.sort_order = 'ordernum_asc'

    index do
      column 'Вопрос теста' do |paragraphtest|
        paragraphtest.itemtest.title_full
      end
      column 'Порядок', :ordernum, :sortable
      column 'Тип абзаца', :paragraphtype
      column 'Текст', :body
      #column 'Картинка', :image
      column 'Позиция картинки', :posimage
      #if paragraphtest.image.representable? 
      #  image_tag paragraphtest.image.representation(resize_to_limit: [30, 30])
      #end

      actions
    end
     
    form title: 'Абзац' do |f|
      f.inputs 'Основные' do
        f.columns do
          f.column max_width: "100px", min_width: "80px" do span "Вопрос " end
          f.column do input :itemtest, label: false  end #, input_html: { disabled: true }
          f.column max_width: "100px", min_width: "80px" do span "Тип абзаца " end
          f.column do input :paragraphtype, label: false end #, input_html: { disabled: true }
          f.column max_width: "100px", min_width: "80px" do span "Порядок" end
          f.column do input :ordernum, label: false end
        end
        #if paragraphtest.paragraphtype.id == 3 and (paragraphtest.responsetype_id == 1 or paragraphtest.responsetype_id == 2)
        #else
          f.columns do
            f.column max_width: "100px", min_width: "80px" do span "Текст" end
            f.column span: 2 do input :body, label: false end
          end
        #end
        f.columns do
          f.column max_width: "100px", min_width: "80px" do span "Картинка" end
          f.column do image_tag paragraphtest.image if paragraphtest.image.attached? end
          f.column max_width: "100px", min_width: "80px" do span "Позиция картинки" end
          f.column do input :posimage, label: false end
          f.column do 
            f.file_field :image, multiple: false, direct_upload: 'true'
          end
        end
      end
  
      f.actions do
        f.action :submit
        if paragraphtest.itemtest
          f.cancel_link({controller: :itemtests, action: :edit, id: paragraphtest.itemtest.id })
        else
          f.cancel_link({controller: :itemtests, action: :index })
        end 
      end
    end  

    filter :itemtest
    filter :ordernum

    # Контролер тоже не надо отдельно делать прям здесь
  controller do

    def create
      create! { edit_admin_itemtest_url( resource.itemtest_id ) }
    end 
    
    def update
      @paragraphtest = Paragraphtest.find(params[:id])
      update! { edit_admin_itemtest_url( @paragraphtest.itemtest_id ) }
    end 

    def destroy
      @paragraphtest = Paragraphtest.find(params[:id])
      destroy! { edit_admin_itemtest_url( @paragraphtest.itemtest_id ) }
    end 

  end

  
    #
    # or
    #
    # permit_params do
    #   permitted = [:result_id, :namefile]
    #   permitted << :other if params[:action] == 'create' && current_user.admin?
    #   permitted
    # end
    
end
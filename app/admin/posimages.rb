ActiveAdmin.register Posimage do

    menu parent: "Справочники", label: "Расположение картинки"
    config.sort_order = 'title_asc'
    permit_params :title
  
    index do
      id_column
      column :title
      actions
    end
     
      filter :title
    #
    # or
    #
    #permit_params do
    #  permitted = [:title]
    #  #permitted << :other if params[:action] == 'create' && current_user.admin?
    #  permitted
    #end
    
end
  
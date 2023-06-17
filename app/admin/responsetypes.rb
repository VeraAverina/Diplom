ActiveAdmin.register Responsetype do

    config.sort_order = 'id_asc'
    permit_params :title

    menu parent: "Справочники", label: "Тип ответа теста"

    filter :title

    index do
      column :id
      column "Название", :title
    end
  #
  # or
  #
  # permit_params do
  #   permitted = [:title]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end

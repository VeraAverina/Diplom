ActiveAdmin.register Paragraphtype do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
    permit_params :title
    menu parent: "Справочники", label: "Тип параграфа теста"
    config.sort_order = 'title_asc'

    filter :title
  #
  # or
  #
  # permit_params do
  #   permitted = [:title]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end

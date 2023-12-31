ActiveAdmin.register Role do
  menu parent: "Webquest", label: "Роли в Webquest"

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :webtest_id, :name, :description
  #
  # or
  #
  # permit_params do
  #   permitted = [:webtest_id_id, :name, :description]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end

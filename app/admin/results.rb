ActiveAdmin.register Result do
  #menu parent: "Webquest", label: "Результаты Webquest"

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :resultfile_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :role_id, :mark, :comment]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end

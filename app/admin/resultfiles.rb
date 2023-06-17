ActiveAdmin.register Resultfile do
  menu parent: "Webquest", label: "Файлы результатов Webquest"

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :name, :namefile, :mark, :comment #, :user_id, :namefile, :name
  #
  # or
  #
  # permit_params do
  #   permitted = [:result_id, :namefile]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end

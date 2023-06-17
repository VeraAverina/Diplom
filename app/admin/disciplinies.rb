ActiveAdmin.register Discipline do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
    menu parent: "Справочники", label: "Дисциплины"
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
  # permit_params do
  #   permitted = [:result_id, :namefile]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end

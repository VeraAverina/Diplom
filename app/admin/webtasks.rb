ActiveAdmin.register Webtask do
  menu parent: "Webquest", label: "Задания Webquest"

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :role_id, :taskname, :tasktask

  index do
    #sortable_handle_column :role_id, :taskname
    selectable_column
    id_column
    column :role_id
    column :taskname
    column :tasktask
    actions
  end
   
   filter :role_id
   filter :taskname
   filter :tasktask

  #
  # or
  #
  # permit_params do
  #   permitted = [:role_id, :taskname, :tasktask]
     #permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end

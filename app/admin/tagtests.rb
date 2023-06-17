ActiveAdmin.register Tagtest do
  menu parent: "Справочники", label: "Тэги предметов"

  permit_params :discipline_id, :title
  #
  # or
  #
  # permit_params do
  #   permitted = [:discipline_id, :titlet]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  def to_s
    discipline.title + " [" + title + "]"
  end
  
end

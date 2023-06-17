class RenameTitletFromTagtest < ActiveRecord::Migration[6.1]
  def change
    rename_column :tagtests, :titlet, :title
  end
end

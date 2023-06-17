class AddColumnToTestexecsteps < ActiveRecord::Migration[6.1]
  def change
    add_column :testexecsteps, :response, :string
  end
end

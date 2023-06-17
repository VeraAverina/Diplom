class AddColumnRatioToTestexecsteps < ActiveRecord::Migration[6.1]
  def change
    add_column :testexecsteps, :ratio, :integer
  end
end

class AddColumnCountexecToTestexecsteps < ActiveRecord::Migration[6.1]
  def change
    add_column :testexecsteps, :countexec, :integer
    add_column :testexecsteps, :laststart, :datetime
  end
end

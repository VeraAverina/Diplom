class AddColumnDurationToTestexecsteps < ActiveRecord::Migration[6.1]
  def change
    add_column :testexecsteps, :duration, :integer
  end
end

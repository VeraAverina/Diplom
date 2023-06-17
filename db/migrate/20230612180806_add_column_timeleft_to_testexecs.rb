class AddColumnTimeleftToTestexecs < ActiveRecord::Migration[6.1]
  def change
    add_column :testexecs, :notexec, :integer
    add_column :testexecs, :timelrft, :integer
  end
end

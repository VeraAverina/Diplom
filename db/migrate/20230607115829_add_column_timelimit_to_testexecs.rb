class AddColumnTimelimitToTestexecs < ActiveRecord::Migration[6.1]
  def change
    add_column :testexecs, :timelimit, :integer
    add_column :testexecs, :enskipstep, :boolean
  end
end

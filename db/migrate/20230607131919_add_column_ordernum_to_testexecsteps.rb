class AddColumnOrdernumToTestexecsteps < ActiveRecord::Migration[6.1]
  def change
    add_column :testexecsteps, :ordernum, :integer
  end
end

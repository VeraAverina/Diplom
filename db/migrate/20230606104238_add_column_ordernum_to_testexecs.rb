class AddColumnOrdernumToTestexecs < ActiveRecord::Migration[6.1]
  def change
    add_column :testexecs, :ordernum, :integer
  end
end

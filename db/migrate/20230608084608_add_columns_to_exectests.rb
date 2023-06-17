class AddColumnsToExectests < ActiveRecord::Migration[6.1]
  def change
    add_column :testexecs, :responseall, :integer
    add_column :testexecs, :responseok, :integer
    add_column :testexecs, :responseerror, :integer
    add_column :testexecs, :responseskip, :integer
  end
end

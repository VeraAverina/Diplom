class AddNameToResultfile < ActiveRecord::Migration[6.1]
  def change
    add_column :resultfiles, :name, :string
  end
end

class AddMarkToResultfile < ActiveRecord::Migration[6.1]
  def change
    add_column :resultfiles, :mark, :integer
  end
end

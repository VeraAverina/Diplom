class AddColumnTitleToItemtest < ActiveRecord::Migration[6.1]
  def change
    add_column :itemtests, :title, :string
  end
end

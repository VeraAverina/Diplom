class AddColumncToItemtest < ActiveRecord::Migration[6.1]
  def change
    add_reference :itemtests, :onetest, null: false, foreign_key: true
  end
end

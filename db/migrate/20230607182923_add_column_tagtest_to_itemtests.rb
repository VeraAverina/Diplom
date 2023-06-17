class AddColumnTagtestToItemtests < ActiveRecord::Migration[6.1]
  def change
    add_reference :itemtests, :tagtest, null: true, foreign_key: true
  end
end


class AddItemtestIdToParagraphtests < ActiveRecord::Migration[6.1]
  def change
    add_reference :paragraphtests, :itemtest, null: false, foreign_key: true
  end
end

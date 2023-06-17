class AddColumnParagraphtypeToParagraphtest < ActiveRecord::Migration[6.1]
  def change
    add_reference :paragraphtests, :paragraphtype, null: false, foreign_key: true
  end
end

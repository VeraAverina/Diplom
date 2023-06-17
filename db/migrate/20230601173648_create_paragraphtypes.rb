class CreateParagraphtypes < ActiveRecord::Migration[6.1]
  def change
    create_table :paragraphtypes do |t|
      t.string :title

      t.timestamps
    end
  end
end

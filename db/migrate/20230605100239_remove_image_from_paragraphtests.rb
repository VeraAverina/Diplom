class RemoveImageFromParagraphtests < ActiveRecord::Migration[6.1]
  def change
    remove_column :paragraphtests, :image, :string
  end
end

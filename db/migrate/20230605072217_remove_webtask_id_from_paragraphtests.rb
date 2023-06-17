class RemoveWebtaskIdFromParagraphtests < ActiveRecord::Migration[6.1]
  def change
    remove_column :paragraphtests, :webtask_id, :bigint
  end
end

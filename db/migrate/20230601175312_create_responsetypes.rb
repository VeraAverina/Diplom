class CreateResponsetypes < ActiveRecord::Migration[6.1]
  def change
    create_table :responsetypes do |t|
      t.string :title

      t.timestamps
    end
  end
end

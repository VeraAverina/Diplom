class CreateResponserights < ActiveRecord::Migration[6.1]
  def change
    create_table :responserights do |t|
      t.references :itemtest, null: false, foreign_key: true
      t.string :response

      t.timestamps
    end
  end
end

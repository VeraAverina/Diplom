class CreateTestexecs < ActiveRecord::Migration[6.1]
  def change
    create_table :testexecs do |t|
      t.references :onetest, null: false, foreign_key: true
      t.datetime :datestart
      t.datetime :datefinish
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

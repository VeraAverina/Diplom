class CreateResultfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :resultfiles do |t|
      t.references :result, null: false, foreign_key: true
      t.string :namefile

      t.timestamps
    end
  end
end

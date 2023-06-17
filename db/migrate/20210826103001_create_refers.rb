class CreateRefers < ActiveRecord::Migration[6.1]
  def change
    create_table :refers do |t|
      t.references :role, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end

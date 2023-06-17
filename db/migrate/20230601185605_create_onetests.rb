class CreateOnetests < ActiveRecord::Migration[6.1]
  def change
    create_table :onetests do |t|
      t.string :title
      t.references :discipline, null: false, foreign_key: true
      t.integer :ratio5
      t.integer :ratio4
      t.integer :ratio3
      t.integer :ratio2

      t.timestamps
    end
  end
end

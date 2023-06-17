class CreateItemtests < ActiveRecord::Migration[6.1]
  def change
    create_table :itemtests do |t|
      t.integer :ordernum
      t.integer :ratio
      t.references :responsetype, null: false, foreign_key: true

      t.timestamps
    end
  end
end

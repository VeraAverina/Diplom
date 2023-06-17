class CreateTagtests < ActiveRecord::Migration[6.1]
  def change
    create_table :tagtests do |t|
      t.references :discipline, null: false, foreign_key: true
      t.string :titlet

      t.timestamps
    end
  end
end

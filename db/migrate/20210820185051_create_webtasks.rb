class CreateWebtasks < ActiveRecord::Migration[6.1]
  def change
    create_table :webtasks do |t|
      t.references :role, null: false, foreign_key: true
      t.string :taskname
      t.text :tasktask

      t.timestamps
    end
  end
end

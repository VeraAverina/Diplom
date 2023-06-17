class CreateTestexecsteps < ActiveRecord::Migration[6.1]
  def change
    create_table :testexecsteps do |t|
      t.references :testexec, null: false, foreign_key: true
      t.datetime :datestart
      t.datetime :datefinish
      t.references :itemtest, null: false, foreign_key: true

      t.timestamps
    end
  end
end

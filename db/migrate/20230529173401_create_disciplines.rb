class CreateDisciplines < ActiveRecord::Migration[6.1]
  def change
    create_table :disciplines do |t|
      t.string :title

      t.timestamps
    end
  end
end

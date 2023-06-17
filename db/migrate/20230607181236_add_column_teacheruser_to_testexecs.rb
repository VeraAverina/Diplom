class AddColumnTeacheruserToTestexecs < ActiveRecord::Migration[6.1]
  def change
    add_reference :testexecs, :teacheruser, null: true #, foreign_key: true

    add_foreign_key :testexecs, :users, column: :teacheruser_id, primary_key: :id
  end
end

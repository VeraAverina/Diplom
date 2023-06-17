class AddColumnAssessmentToTestexecs < ActiveRecord::Migration[6.1]
  def change
    add_column :testexecs, :assessment, :integer
    add_column :testexecs, :ratio, :integer
    add_reference :testexecs, :teacher_user, null: true #, foreign_key: true

    add_foreign_key :testexecs, :users, column: :teacher_user_id, primary_key: :id
  end
end

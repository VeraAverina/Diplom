class RemoveColumnTeachUserFromTestexecs < ActiveRecord::Migration[6.1]
  def change
    remove_reference :testexecs, :teacher_user, null: true #, foreign_key: true
  end
end

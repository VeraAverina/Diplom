class RemoveRoleFromResult < ActiveRecord::Migration[6.1]
  def change
    remove_reference :results, :role, null: false, foreign_key: true
  end
end

class RemoveUserIdFromResult < ActiveRecord::Migration[6.1]
  def change
    remove_reference :results, :user, null: false, foreign_key: true
  end
end

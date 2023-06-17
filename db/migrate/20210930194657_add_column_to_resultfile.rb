class AddColumnToResultfile < ActiveRecord::Migration[6.1]
  def change
    add_reference :resultfiles, :user, null: false, foreign_key: true
  end
end

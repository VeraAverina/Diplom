class AddCommentToResultfile < ActiveRecord::Migration[6.1]
  def change
    add_column :resultfiles, :comment, :string
  end
end

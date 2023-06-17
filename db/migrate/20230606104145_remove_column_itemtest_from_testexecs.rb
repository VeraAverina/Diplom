class RemoveColumnItemtestFromTestexecs < ActiveRecord::Migration[6.1]
  def change
    remove_reference :testexecs, :itemtest, null: false, foreign_key: true
  end
end

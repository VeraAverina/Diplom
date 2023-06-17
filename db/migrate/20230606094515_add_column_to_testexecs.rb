class AddColumnToTestexecs < ActiveRecord::Migration[6.1]
  def change
    #add_column :testexecs, :itemtest, :references
    add_reference :testexecs, :itemtest, null: false, foreign_key: true
  end
end

class AddColumncToResult < ActiveRecord::Migration[6.1]
  def self.up
    remove_column :resultfiles, :result_id
  end

  def change
    add_reference :results, :resultfile, null: false, foreign_key: true
  end
end

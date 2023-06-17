class RemoveResultIdFromResultfiless < ActiveRecord::Migration[6.1]
  def change
    remove_reference :resultfiles, :result, null: false, foreign_key: true
  end
end

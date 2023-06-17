class RenameTimeleftFromTestexecs < ActiveRecord::Migration[6.1]
  def change
    rename_column :testexecs, :timelrft, :timeleft
  end
end

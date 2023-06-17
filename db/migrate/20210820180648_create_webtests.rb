class CreateWebtests < ActiveRecord::Migration[6.1]
  def change
    create_table :webtests do |t|
      t.string :title

      t.timestamps
    end
  end
end

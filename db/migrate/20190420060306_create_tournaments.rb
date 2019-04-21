class CreateTournaments < ActiveRecord::Migration[5.1]
  def change
    create_table :tournaments do |t|
      t.references :event, foreign_key: true
      t.integer :round, null: false, default: 0
      t.timestamps
    end
  end
end

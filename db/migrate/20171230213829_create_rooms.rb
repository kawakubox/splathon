class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.belongs_to :event, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end

class AddPriorityOnRooms < ActiveRecord::Migration[5.1]
  def change
    add_column :rooms, :priority, :integer, null: false, default: 0
  end
end

class AddRoomIdOnMatch < ActiveRecord::Migration[5.1]
  def change
    add_column :matches, :room_id, :integer
  end
end

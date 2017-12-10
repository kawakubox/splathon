class DeletePointsOnMatches < ActiveRecord::Migration[5.1]
  def up
    remove_column :matches, :points
  end

  def down
    add_column :matches, :points, :integer
  end
end

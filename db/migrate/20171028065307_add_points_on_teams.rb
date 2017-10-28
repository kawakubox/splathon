class AddPointsOnTeams < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :points, :integer, null: false, default: 0
  end
end

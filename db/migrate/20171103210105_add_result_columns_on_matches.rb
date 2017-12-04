class AddResultColumnsOnMatches < ActiveRecord::Migration[5.1]
  def change
    add_column :matches, :qualifier_id,    :integer
    add_column :matches, :team_points,     :integer
    add_column :matches, :opponent_points, :integer
  end
end

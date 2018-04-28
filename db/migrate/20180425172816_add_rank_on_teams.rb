class AddRankOnTeams < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :rank, :integer, null: false, default: 0
  end
end

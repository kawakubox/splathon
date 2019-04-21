class AddNameOnTournament < ActiveRecord::Migration[5.1]
  def change
    add_column :tournaments, :name, :string, null: false, default: 'XX回戦'
  end
end

class AddKanaOnTeam < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :name_kana, :string
  end
end

class AddCodeAndNumberingOnEvents < ActiveRecord::Migration[5.1]
  def up
    add_column :events, :series_name, :string, null: false, default: 'splathon'
    add_column :events, :numbering, :integer, null: false, default: 0

    execute('UPDATE events SET numbering = id, updated_at = NOW()')

    add_index :events, [:series_name, :numbering], unique: true
  end

  def down
    remove_index :events, column: [:series_name, :numbering]
    remove_column :events, :series_name
    remove_column :events, :numbering
  end
end

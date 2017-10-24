class RenameMatchResults < ActiveRecord::Migration[5.1]
  def up
    rename_table :match_results, :matches
  end

  def down
    rename_table :matches, :match_results
  end
end

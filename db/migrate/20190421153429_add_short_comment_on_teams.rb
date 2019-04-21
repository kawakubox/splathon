class AddShortCommentOnTeams < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :short_comment, :string
  end
end

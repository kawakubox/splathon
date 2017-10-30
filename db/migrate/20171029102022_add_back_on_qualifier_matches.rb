class AddBackOnQualifierMatches < ActiveRecord::Migration[5.1]
  def change
    add_column :qualifier_matches, :back, :boolean
  end
end

class AddOrderOfMatchOnQualifierMatches < ActiveRecord::Migration[5.1]
  def up
    add_column :qualifier_matches, :order_of_match, :integer
    change_column :qualifier_matches, :order_of_match, :integer, null: false
    add_index :qualifier_matches, [:qualifier_id, :order_of_match]
  end

  def down
    remove_index :qualifier_matches, [:qualifier_id, :order_of_match]
    remove_column :qualifier_matches, :order_of_match
  end
end

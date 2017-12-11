class DropQualifierMatches < ActiveRecord::Migration[5.1]
  def up
    drop_table :qualifier_matches
  end

  def down
    create_table :qualifier_matches do |t|
      t.belongs_to :qualifier, null: false
      t.belongs_to :match, null: false
      t.integer :order_of_match, null: false
      t.boolean :back
      t.timestamps

      t.index [:qualifier_id, :match_id], unique: true
      t.index [:qualifier_id, :order_of_match]
    end
  end
end

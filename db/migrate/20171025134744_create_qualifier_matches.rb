class CreateQualifierMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :qualifier_matches do |t|
      t.belongs_to :qualifier, null: false
      t.belongs_to :match,     null: false
      t.timestamps

      t.index [:qualifier_id, :match_id], unique: true
    end
  end
end

class CreateQualifiers < ActiveRecord::Migration[5.1]
  def change
    create_table :qualifiers do |t|
      t.belongs_to :event, null: false
      t.integer :round
      t.integer :order_of_match
      t.timestamps
    end
  end
end

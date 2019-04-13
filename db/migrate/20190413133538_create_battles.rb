class CreateBattles < ActiveRecord::Migration[5.1]
  def change
    create_table :battles do |t|
      t.references :match, foreign_key: true, null: false
      t.references :rule, foreign_key: true, null: false
      t.references :stage, foreign_key: true, null: false
      t.bigint :winner_id
      t.integer :order, null: false
      t.timestamps

      t.index [:match_id, :order], unique: true
    end
  end
end

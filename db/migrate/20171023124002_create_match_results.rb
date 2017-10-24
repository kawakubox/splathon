# frozen_string_literal: true

class CreateMatchResults < ActiveRecord::Migration[5.1]
  def change
    create_table :match_results do |t|
      t.belongs_to :team, null: false
      t.integer :opponent_id, null: false
      t.integer :points
      t.timestamps

      t.index :opponent_id
    end
  end
end

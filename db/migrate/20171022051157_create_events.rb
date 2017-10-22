# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.date   :held_on
      t.string :name
      t.timestamps

      t.index :held_on
    end
  end
end

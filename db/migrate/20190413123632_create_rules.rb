class CreateRules < ActiveRecord::Migration[5.1]
  def change
    create_table :rules do |t|
      t.string :key, null: false
      t.string :name, null: false

      t.timestamps

      t.index :key, unique: true
      t.index :name, unique: true
    end
  end
end

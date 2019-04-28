class CreateNotices < ActiveRecord::Migration[5.1]
  def change
    create_table :notices do |t|
      t.references :event, foreign_key: true, null: false
      t.text :text, null: false

      t.timestamps
    end
  end
end

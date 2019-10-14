class CreateSlackBillingChanges < ActiveRecord::Migration[5.1]
  def change
    create_table :slack_billing_changes do |t|
      t.string :detected_on, null: false
      t.string :member_id, null: false
      t.string :display_name, null: false
      t.string :action, null: false

      t.timestamps
    end
  end
end

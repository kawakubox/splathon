class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.belongs_to :event
      t.string     :name
      t.string     :company_name
      t.timestamps
    end
  end
end

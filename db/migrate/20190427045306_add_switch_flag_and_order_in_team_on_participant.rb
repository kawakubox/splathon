class AddSwitchFlagAndOrderInTeamOnParticipant < ActiveRecord::Migration[5.1]
  def change
    add_column :participants, :has_switch_dock, :boolean, null: false, default: false
    add_column :participants, :order_in_team, :integer
  end
end

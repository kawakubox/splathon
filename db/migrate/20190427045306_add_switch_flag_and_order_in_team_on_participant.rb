class AddSwitchFlagAndOrderInTeamOnParticipant < ActiveRecord::Migration[5.1]
  def change
    add_column :participants, :has_switch_dock, :boolean
    add_column :participants, :order_in_team, :integer
  end
end

# frozen_string_literal: true

class Api::EventsController < ActionController::API
  before_action { @event = Event.find(params[:id]) }

  def latest_matches
    @team = @event.teams.find_by(name: params[:team_name])
    return [] if @event.qualifiers.blank?
    @matches = @event.qualifiers.last.matches.order('room_id' => :asc, 'order' => :asc)
    @matches = @matches.select { |m| m.team == @team || m.opponent == @team  } if @team
  end
end

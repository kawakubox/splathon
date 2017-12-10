# frozen_string_literal: true

class MatchesController < ApplicationController
  before_action :set_match, only: %i[edit update win draw lose]

  # GET /matches
  # GET /matches.json
  def index
    @matches = Match.all
  end

  def edit
  end

  def update
    @match.update!(match_params)
    redirect_to top_event_path(@match.qualifier.event)
  end

  # POST /matches
  # POST /matches.json
  def create
    @event = Event.find(params[:event_id])

    ActiveRecord::Base.transaction do
      @match = Match.new(event: @event)
      @match.round = Match.next_round(@event.id)
      Drawer.new.swiss_draw(@match)
      @match.save!
    end
    redirect_to top_event_path(@event)
  end

  def win
    @match.update!(team_points: 3, opponent_points: 0) if params[:reciever] == 'team'
    @match.update!(team_points: 0, opponent_points: 3) if params[:reciever] == 'opponent'
    redirect_to matches_event_qualifier_path(
      id: @match.qualifier,
      event_id: @match.qualifier.event.id)
  end

  def draw
    @match.update!(team_points: 1, opponent_points: 1) if params[:reciever] == 'team'
    @match.update!(team_points: 1, opponent_points: 1) if params[:reciever] == 'opponent'
    redirect_to matches_event_qualifier_path(
      id: @match.qualifier,
      event_id: @match.qualifier.event.id)
  end

  def lose
    @match.update!(team_points: 0, opponent_points: 3) if params[:reciever] == 'team'
    @match.update!(team_points: 3, opponent_points: 0) if params[:reciever] == 'opponent'
    redirect_to matches_event_qualifier_path(
      id: @match.qualifier.id,
      event_id: @match.qualifier.event.id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find(params[:id])
    end

    def match_params
      params.require(:match).permit(:team_id, :opponent_id)
    end
end

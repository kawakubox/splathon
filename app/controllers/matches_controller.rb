# frozen_string_literal: true

class MatchesController < ApplicationController
  before_action :set_match, only: [:win, :draw, :lose]

  # GET /matches
  # GET /matches.json
  def index
    @matches = Match.all
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
    @match.update!(points: 3)
    QualifierMatch.find_by(match: @match).back_combination.match.update!(points: 0)
    redirect_to matches_event_qualifier_path(
      id: @match.qualifier_match.qualifier.id, event_id: @match.id,
      event_id: @match.qualifier_match.qualifier.event.id)
  end

  def draw
    @match.update!(points: 1)
    QualifierMatch.find_by(match: @match).back_combination.match.update!(points: 1)
    redirect_to matches_event_qualifier_path(
      id: @match.qualifier_match.qualifier.id, event_id: @match.id,
      event_id: @match.qualifier_match.qualifier.event.id)
  end

  def lose
    @match.update!(points: 0)
    QualifierMatch.find_by(match: @match).back_combination.match.update!(points: 3)
    redirect_to matches_event_qualifier_path(
      id: @match.qualifier_match.qualifier.id, event_id: @match.id,
      event_id: @match.qualifier_match.qualifier.event.id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find(params[:id])
    end
end

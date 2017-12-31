# frozen_string_literal: true

class Match < ApplicationRecord
  belongs_to :team
  belongs_to :opponent, class_name: 'Team'
  belongs_to :qualifier
  belongs_to :room

  after_commit { team.aggregate_points; opponent.aggregate_points }

  def points(team)
    self.team == team ? team_points : opponent_points
  end
end

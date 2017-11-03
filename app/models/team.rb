# frozen_string_literal: true

class Team < ApplicationRecord
  belongs_to :event

  validates :name, presence: true

  def match_count
    Match.where(team: self).where.not(points: nil).count
  end

  def rank
    event.teams.where('points > ?', points).count + 1
  end

  def aggregate_points
    update!(points: Match.where(team: self).sum(:points))
  end

  def result(qualifier)
    case qualifier.matches.where(team: self).first.points
    when 0 then 'Lose'
    when 1 then 'Draw'
    when 3 then 'Win'
    else ''
    end
  end
end

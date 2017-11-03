# frozen_string_literal: true

class Team < ApplicationRecord
  belongs_to :event

  validates :name, presence: true

  def rank
    event.teams.where('points > ?', points).count + 1
  end
end

# frozen_string_literal: true

class Qualifier < ApplicationRecord
  belongs_to :event
  has_many   :qualifier_matches, dependent: :destroy
  has_many   :matches, dependent: :destroy

  def self.next_round(event_id)
    Qualifier.where(event_id: event_id).maximum(:round).to_i + 1
  end

  def preinitiation?
    matches.all? { |m| m.team_points.blank? && m.opponent_points.blank? }
  end

  def done?
    matches.all? { |m| m.team_points.present? && m.opponent_points.present? }
  end
end

# frozen_string_literal: true

class Qualifier < ApplicationRecord
  belongs_to :event
  has_many   :qualifier_matches, dependent: :destroy
  has_many   :matches, through: :qualifier_matches

  def self.next_round(event_id)
    Qualifier.where(event_id: event_id).maximum(:round).to_i + 1
  end
end

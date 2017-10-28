# frozen_string_literal: true

class Qualifier < ApplicationRecord
  belongs_to :event
  has_many   :qualifier_matches
  has_many   :matches, through: :qualifier_matches
end

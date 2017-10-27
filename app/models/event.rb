# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :teams

  validates :name, presence: true
end

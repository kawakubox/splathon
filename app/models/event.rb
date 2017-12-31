# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :teams
  has_many :qualifiers
  has_many :rooms

  validates :name, presence: true
end

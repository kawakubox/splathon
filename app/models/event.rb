# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :teams
  has_many :qualifiers
  has_many :rooms, dependent: :destroy

  validates :name, presence: true
  validates :numbering, numericality: true, uniqueness: { scope: :series_name }
end

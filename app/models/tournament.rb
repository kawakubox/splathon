# frozen_string_literal: true

class Tournament < ApplicationRecord
  belongs_to :event

  validates :event, presence: true
  validates :round, presence: true
  validates :name, presence: true
end

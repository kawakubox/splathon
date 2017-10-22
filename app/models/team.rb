# frozen_string_literal: true

class Team < ApplicationRecord
  belongs_to :event

  validates :name, presence: true
end

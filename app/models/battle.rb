# frozen_string_literal: true

class Battle < ApplicationRecord
  belongs_to :match
  belongs_to :rule
  belongs_to :stage
  belongs_to :winner, class_name: 'Team'

  enum rule: %i(turf_war splat_zones tower_control rainmaker clam_blitz)

  validates :match, presence: true
  validates :rule, presence: true
  validates :stage, presence: true
  validates :order, presence: true
end

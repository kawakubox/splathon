# frozen_string_literal: true

class MatchResult < ApplicationRecord
  belongs_to :team
  belongs_to :opponent, class_name: 'Team'
end

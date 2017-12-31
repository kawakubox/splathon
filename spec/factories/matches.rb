# frozen_string_literal: true

FactoryBot.define do
  factory :match do
    qualifier
    team
    opponent { FactoryBot.create(:team) }
    team_points { [0, 1, 3].sample }
    opponent_points { [0, 1, 3].sample }
    room
  end
end

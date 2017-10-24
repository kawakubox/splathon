# frozen_string_literal: true

FactoryBot.define do
  factory :match_result do
    team
    opponent { FactoryBot.create(:team) }
    points { [0, 1, 3].sample }
  end
end

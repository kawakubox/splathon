# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    held_on { Time.zone.today }
    name { "Splathon##{Random.rand(1..10)}" }
  end
end

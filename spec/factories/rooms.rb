# frozen_string_literal: true

FactoryBot.define do
  factory :room do
    event
    sequence(:name) { |i| "Room-#{i}" }
  end
end

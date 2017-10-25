# frozen_string_literal: true

FactoryBot.define do
  factory :qualifier do
    event
    sequence(:round) { |n| n }
    sequence(:order_of_match) { |n| n }
  end
end

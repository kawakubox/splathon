# frozen_string_literal: true

FactoryBot.define do
  factory :qualifier_match do
    qualifier
    sequence(:order_of_match) { |n| n }
    match
  end
end

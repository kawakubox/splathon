# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    held_on { Time.zone.today }
    name { "Splathon##{Random.rand(1..10)}" }
    series_name { 'splathon' }
    sequence(:numbering) { |i| i }
  end
end

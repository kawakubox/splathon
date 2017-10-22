# frozen_string_literal: true

FactoryBot.define do
  factory :team do
    name { "Team-#{Random.rand(1..10)}" }
    company_name { Faker::Company.name }
  end
end

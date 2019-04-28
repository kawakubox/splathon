FactoryBot.define do
  factory :notice do
    event
    text { Faker::Lorem.paragraph }
  end
end

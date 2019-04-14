FactoryBot.define do
  factory :battle do
    match
    rule
    stage
    sequence(:order) { |i| i }
  end
end

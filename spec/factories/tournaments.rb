FactoryBot.define do
  factory :tournament do
    sequence(:round) { |i| i + 1 }
    event
  end
end

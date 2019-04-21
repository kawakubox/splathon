FactoryBot.define do
  factory :tournament do
    sequence(:round) { |i| i + 1 }
    event
    name { "#{round}回戦" }
  end
end

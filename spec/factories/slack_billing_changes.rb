FactoryBot.define do
  factory :slack_billing_change do
    detected_on { Faker::Date.between(1.year.ago, Date.today) }
    account_name { Faker::Name.name }
    action { Faker::Lorem.sentence }
  end
end

FactoryBot.define do
  factory :slack_billing_change do
    detected_on { Faker::Date.between(1.year.ago, Date.today) }
    member_id { 'U' + Faker::Alphanumeric.alphanumeric(8).upcase }
    display_name { Faker::Name.name }
    action { Faker::Lorem.sentence }
  end
end

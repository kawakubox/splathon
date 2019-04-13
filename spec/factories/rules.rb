FactoryBot.define do
  factory :rule do
    key { %w(turf_war splat_zones tower_control rainmaker clam_blitz).to_a.sample }
    name { %w(ナワバリバトル ガチエリア ガチヤグラ ガチホコバトル ガチアサリ).to_a.sample }
  end
end

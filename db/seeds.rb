# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

stages = [
  { id: 0,    name: "バッテラストリート" },
  { id: 1,    name: "フジツボスポーツクラブ" },
  { id: 2,    name: "ガンガゼ野外音楽堂" },
  { id: 3,    name: "チョウザメ造船" },
  { id: 4,    name: "海女美術大学" },
  { id: 5,    name: "コンブトラック" },
  { id: 6,    name: "マンタマリア号" },
  { id: 7,    name: "ホッケふ頭" },
  { id: 8,    name: "タチウオパーキング" },
  { id: 9,    name: "エンガワ河川敷" },
  { id: 10,   name: "モズク農園" },
  { id: 11,   name: "Ｂバスパーク" },
  { id: 12,   name: "デボン海洋博物館" },
  { id: 13,   name: "ザトウマーケット" },
  { id: 14,   name: "ハコフグ倉庫" },
  { id: 15,   name: "アロワナモール" },
  { id: 16,   name: "モンガラキャンプ場" },
  { id: 17,   name: "ショッツル鉱山" },
  { id: 18,   name: "アジフライスタジアム" },
  { id: 19,   name: "ホテルニューオートロ" },
  { id: 20,   name: "スメーシーワールド" },
  { id: 21,   name: "アンチョビットゲームズ" },
  { id: 22,   name: "ムツゴ楼" },
  { id: 9999, name: "ミステリーゾーン" }
]

stages.each do |stage|
  record = Stage.find_or_initialize_by(id: stage[:id])
  record.name = stage[:name]
  record.save!
end

rules = [
  { id: 0, name: "ナワバリバトル", key: "turf_war" },
  { id: 1, name: "ガチエリア", key: "splat_zones" },
  { id: 2, name: "ガチヤグラ", key: "tower_control" },
  { id: 3, name: "ガチホコバトル", key: "rainmaker" },
  { id: 4, name: "ガチアサリ", key: "clam_blitz" },
]

rules.each do |rule|
  record = Rule.find_or_initialize_by(id: rule[:id])
  record.attributes = rule.slice(:name, :key)
  record.save!
end

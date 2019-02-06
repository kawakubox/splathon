json.array!(@matches) do |match|
  json.room  match.room&.name
  json.order match.order
  json.home  match.team.name
  json.away  match.opponent.name
end

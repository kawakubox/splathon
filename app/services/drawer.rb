# frozen_string_literal: true

class Drawer
  def self.swiss_draw(qualifier)
    qualifier.event.teams.to_a.shuffle.sort_by(&:points).each_slice(2).with_index(1) do |teams, i|
      m1 = Match.create!(team: teams[0], opponent: teams[1])
      QualifierMatch.create!(qualifier: qualifier, order_of_match: i, match: m1)

      m2 = Match.create!(team: teams[1], opponent: teams[0])
      QualifierMatch.create!(qualifier: qualifier, order_of_match: i, match: m2, back: true)
    end
  end

  def self.redraw(qualifier)
    qualifier.qualifier_matches.each(&:destroy)
    swiss_draw(qualifier)
  end
end

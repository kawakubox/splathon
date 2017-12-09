# frozen_string_literal: true

class Drawer
  def self.swiss_draw(qualifier)
    qualifier.event.teams.to_a.shuffle.sort_by(&:points).each_slice(2).with_index(1) do |teams, i|
      Match.create!(qualifier: qualifier, team: teams[0], opponent: teams[1])
    end
  end

  def self.redraw(qualifier)
    qualifier.matches.each(&:destroy)
    swiss_draw(qualifier)
  end
end

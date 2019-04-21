# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Team, type: :model do
  subject { FactoryBot.build(:team) }
  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:company_name) }
  it { is_expected.to respond_to(:short_comment) }

  describe 'validation' do
    context 'when name is blank' do
      it 'is invalid' do
        expect(FactoryBot.build(:team, name: nil)).to be_invalid
        expect(FactoryBot.build(:team, name: '')).to be_invalid
      end
    end
  end

  describe '#match_count' do
    let(:team) { FactoryBot.create(:team) }
    let(:opponent) { FactoryBot.create(:team) }

    it 'ホーム、アウェイの合算になること' do
      FactoryBot.create(:match, team: team,     opponent: opponent, team_points: 3, opponent_points: 0)
      FactoryBot.create(:match, team: opponent, opponent: team,     team_points: 0, opponent_points: 3)
      expect(team.match_count).to eq 2
    end
  end

  describe '#aggregate_points' do
    let(:team) { FactoryBot.create(:team) }
    let(:opponent) { FactoryBot.create(:team) }

    it 'ホーム、アウェイの合算になること' do
      expect do
        FactoryBot.create(:match, team: team,     opponent: opponent, team_points: 3, opponent_points: 0)
      end.to change { team.reload.points }.to(3)

      expect do
        FactoryBot.create(:match, team: opponent, opponent: team,     team_points: 0, opponent_points: 3)
      end.to change { team.reload.points }.to(6)
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Team, type: :model do
  subject { FactoryBot.build(:team) }
  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:company_name) }

  describe 'validation' do
    context 'when name is blank' do
      it 'is invalid' do
        expect(FactoryBot.build(:team, name: nil)).to be_invalid
        expect(FactoryBot.build(:team, name: '')).to be_invalid
      end
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  subject { FactoryBot.build(:event) }
  it { is_expected.to respond_to(:held_on) }
  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:teams) }

  describe 'validation' do
    context 'when name is blank' do
      it 'is invalid' do
        expect(FactoryBot.build(:event, name: nil)).to be_invalid
        expect(FactoryBot.build(:event, name: '')).to be_invalid
      end
    end
  end
end

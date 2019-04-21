# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  subject { FactoryBot.build(:event) }
  it { is_expected.to respond_to(:held_on) }
  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:teams) }
  it { is_expected.to respond_to(:series_name) }
  it { is_expected.to respond_to(:numbering) }

  describe 'validation' do
    context 'when name is blank' do
      it 'is invalid' do
        expect(FactoryBot.build(:event, name: nil)).to be_invalid
        expect(FactoryBot.build(:event, name: '')).to be_invalid
      end
    end

    it { is_expected.to be_invalid_on(:numbering).with('a') }

    context 'すでに series_name x numbering の組み合わせが存在する場合' do
      before { FactoryBot.create(:event, numbering: subject.numbering) }
      it { is_expected.to be_invalid }
    end
  end
end

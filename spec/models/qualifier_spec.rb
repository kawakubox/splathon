# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Qualifier, type: :model do
  subject { FactoryBot.build(:qualifier) }

  it { is_expected.to respond_to :event_id }
  it { is_expected.to respond_to :round }
  it { is_expected.to respond_to :order_of_match }
  it { is_expected.to respond_to :matches }

  describe '.next_round' do
    let(:event) { FactoryBot.create(:event) }
    context '予選ラウンドが存在しない場合' do
      it '1 であること' do
        expect(Qualifier.next_round(event.id)).to eq 1
      end
    end

    context '予選ラウンド1が存在する場合' do
      it '2 であること' do
        FactoryBot.create(:qualifier, event: event, round: 1)
        expect(Qualifier.next_round(event.id)).to eq 2
      end
    end
  end
end

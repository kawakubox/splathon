require 'rails_helper'

RSpec.describe Notice, type: :model do
  let(:notice) { FactoryBot.build(:notice) }

  describe 'validation' do
    subject { notice }
    it { is_expected.to be_valid }
  end
end

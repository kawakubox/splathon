require 'rails_helper'

RSpec.describe Stage, type: :model do
  let(:stage) { FactoryBot.build(:stage) }

  describe 'validation' do
    subject { stage }
    it { is_expected.to be_invalid_on(:name).with('') }
    it { is_expected.to be_invalid_on(:name).with(nil) }
  end
end

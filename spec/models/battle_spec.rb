require 'rails_helper'

RSpec.describe Battle, type: :model do
  let(:battle) { FactoryBot.build(:battle) }

  describe 'validation' do
    subject { battle }

    it { is_expected.to be_invalid_on(:rule).with(nil) }
    it { is_expected.to be_invalid_on(:order).with(nil) }
  end
end

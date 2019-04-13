require 'rails_helper'

RSpec.describe Rule, type: :model do
  let(:rule) { FactoryBot.build(:rule) }

  describe 'validation' do
    subject { rule }

    it { is_expected.to be_invalid_on(:key).with(nil) }
    it { is_expected.to be_invalid_on(:name).with(nil) }
  end
end

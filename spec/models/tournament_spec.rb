require 'rails_helper'

RSpec.describe Tournament, type: :model do
  let(:tournament) { FactoryBot.build(:tournament) }

  describe 'validation' do
    subject { tournament }

    it { is_expected.to be_valid }
    it { is_expected.to be_invalid_on(:event).with(nil) }
    it { is_expected.to be_invalid_on(:round).with(nil) }
  end
end

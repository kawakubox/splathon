# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Match, type: :model do
  subject { FactoryBot.build(:match) }

  it { is_expected.to respond_to :qualifier }
  it { is_expected.to respond_to :team }
  it { is_expected.to respond_to :opponent }
  it { is_expected.to respond_to :points }
  it { is_expected.to respond_to :tournament }

  describe 'validation' do
    it { is_expected.to be_invalid_on(:team).with(nil) }
    it { is_expected.to be_invalid_on(:opponent).with(nil) }
    it { is_expected.to be_valid_on(:qualifier).with(nil) }
    it { is_expected.to be_valid_on(:tournament).with(nil) }
  end
end

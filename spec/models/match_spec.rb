# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Match, type: :model do
  subject { FactoryBot.build(:match) }

  it { is_expected.to respond_to :team }
  it { is_expected.to respond_to :opponent }
  it { is_expected.to respond_to :points }
end

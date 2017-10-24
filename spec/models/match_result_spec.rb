# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MatchResult, type: :model do
  subject { FactoryBot.build(:match_result) }

  it { is_expected.to respond_to :team }
  it { is_expected.to respond_to :opponent }
  it { is_expected.to respond_to :points }
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe QualifierMatch, type: :model do
  subject { FactoryBot.build(:qualifier_match) }

  it { is_expected.to respond_to :qualifier }
  it { is_expected.to respond_to :match }
end

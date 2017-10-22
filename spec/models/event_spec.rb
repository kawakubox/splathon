# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  subject { FactoryBot.build(:event) }
  it { is_expected.to respond_to(:held_on) }
  it { is_expected.to respond_to(:name) }
end

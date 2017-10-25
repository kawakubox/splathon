# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Qualifier, type: :model do
  subject { FactoryBot.build(:qualifier) }

  it { is_expected.to respond_to :event_id }
  it { is_expected.to respond_to :round }
  it { is_expected.to respond_to :order_of_match }
  it { is_expected.to respond_to :matches }
end

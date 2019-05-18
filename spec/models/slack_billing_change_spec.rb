# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SlackBillingChange do
  let(:billing_change) { FactoryBot.build(:slack_billing_change) }

  it { expect(billing_change).to be_valid }
end

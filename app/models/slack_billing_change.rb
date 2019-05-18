# frozen_string_literal: true

class SlackBillingChange < ApplicationRecord
  validates :account_name, presence: true
  validates :action, presence: true
  validates :detected_on, presence: true
end

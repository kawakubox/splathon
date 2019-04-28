# frozen_string_literal: true

class Notice < ApplicationRecord
  belongs_to :event

  validates :event, presence: true
  validates :text, presence: true
end

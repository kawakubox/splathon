# frozen_string_literal: true

class QualifierMatch < ApplicationRecord
  belongs_to :qualifier
  belongs_to :match, dependent: :destroy
end

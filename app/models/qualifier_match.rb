# frozen_string_literal: true

class QualifierMatch < ApplicationRecord
  belongs_to :qualifier
  belongs_to :match, dependent: :destroy

  def back_combination
    QualifierMatch.where(qualifier: qualifier, order_of_match: order_of_match).where.not(id: id).first
  end
end

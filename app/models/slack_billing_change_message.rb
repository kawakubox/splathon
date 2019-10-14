# frozen_string_literal: true

class SlackBillingChangeMessage < Dry::Struct
  attribute :member_id, Types::String
  attribute :action, Types::String

  def self.parse(message)
    parser = SlackBillingChangeMessageParser.new(message)
    return SlackBillingChange.new(parser.parse)
  end
end
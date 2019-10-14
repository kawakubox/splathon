# frozen_string_literal: true

class SlackBillingChangeParser
  def initialize(dom)
    @dom = dom
  end

  def parse
    member_id = @dom.at('a').attr('href').split('/').last

    parser = SlackBillingChangeMessageParser.new(@dom.text)
    return SlackBillingChange.new(parser.parse.slice(:display_name, :action).merge(member_id: member_id))
  end
end

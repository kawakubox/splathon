# frozen_string_literal: true

class SlackBillingChangeParser
  def initialize(dom)
    @dom = dom
  end

  # { display_name: xxx, action: xxx, member_id: xxx }
  # @return [Hash]
  def parse
    member_id = @dom.find_element(tag_name: 'a').attribute('href').split('/').last
    parser = SlackBillingChangeMessageParser.new(@dom.text)
    return parser.parse.slice(:display_name, :action).merge(member_id: member_id)
  end
end

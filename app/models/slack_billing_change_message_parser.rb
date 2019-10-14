# frozen_string_literal: true

class SlackBillingChangeMessageParser
  def initialize(message)
    @message = message
  end

  def parse
    case
    when joined?
      md = @message.match(/(.*) joined the workspace/)
      return { display_name: md[1].strip, action: 'joined' }
    when active? || inactive?
      md = @message.match(/(.*) was detected as (active|inactive)/)
      return { display_name: md[1].strip, action: md[2].strip }
    when deactivated?
      return { display_name: @message.match(/(.*) was deactivated by/)[1].strip, action: 'deactivated' }
    when reactivated?
      return { display_name: @message.match(/(.*) was reactivated as/)[1].strip, action: 'reactivated' }
    when give_authority?
      md = @message.match(/(.*) became an (Owner|Administrator)/)
      return { display_name: md[1].strip, action: "became #{md[2].strip}" }
    when remove_authority?
      md = @message.match(/(.*) is no longer an (Owner|Administrator)/)
      return { display_name: md[1].strip, action: "no longer #{md[2]}".strip }
    else
      raise StandardError, "未知のメッセージ => #{@message}"
    end
  end

  def joined?
    @message.include?('joined the workspace')
  end

  def active?
    @message.include?('was detected as active')
  end

  def inactive?
    @message.include?('was detected as inactive')
  end

  def deactivated?
    @message.include?('was deactivated by')
  end

  def reactivated?
    @message.include?('was reactivated as')
  end

  def give_authority?
    @message.match?(/became an (Owner|Administrator)/)
  end

  def remove_authority?
    @message.match?(/is no longer an (Owner|Administrator)/)
  end
end

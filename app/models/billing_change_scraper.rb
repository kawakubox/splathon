# frozen_string_literal: true

class BillingChangeScraper
  def initialize(agent)
    @agent = agent
    @page = @agent.get('https://splathon.slack.com/admin/billing/changes')
  end

  def scrape
    user_changes.map { |date, events| events.map { |event| event.detected_on = date; event } }.flatten
  end

  private

  def next_page
    sleep(Random.rand(3..5))
    @page = @page.link_with(text: 'Next').click
  end

  def next?
    is_next = @page.link_with(text: 'Next').href != '#'
    puts "#{@page.uri.to_s} has next page" if is_next
    is_next
  end

  def user_changes
    dates = @page.search('div.col.span_2_of_6').map { |div| div.at('p').text.to_date }
    events = @page.search('div.col.span_4_of_6').map { |div| div.search('p').map { |p| SlackBillingChangeParser.new(p).parse } }

    changes = dates.zip(events)
    if next?
      next_page
      changes.concat(user_changes)
    end
    changes
  end
end

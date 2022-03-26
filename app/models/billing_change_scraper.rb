# frozen_string_literal: true

class BillingChangeScraper
  def initialize(driver)
    @driver = driver
    @driver.get('https://splathon.slack.com/admin/billing/changes')
  end

  def scrape
    user_changes.map { |date, events| events.map { |event| event.merge(detected_on: date) } }.flatten
  end

  private

  def next_page
    @driver.find_element(link_text: 'Next').click
    puts "#{@driver.current_url} is crawling"
  end

  def next?
    is_next = !@driver.find_element(link_text: 'Next').attribute('href').ends_with?('#')
    puts "#{@driver.current_url} has next page" if is_next
    is_next
  end

  def user_changes
    sleep(Random.rand(5..7))
    dates = @driver.find_elements(css: 'div.col.span_2_of_6').map { |div| div.text.to_date }
    events = @driver.find_elements(css: 'div.col.span_4_of_6').map { |div| div.find_elements(tag_name: 'p').map { |p| SlackBillingChangeParser.new(p).parse } }

    changes = dates.zip(events)

    if next?
      next_page
      changes.concat(user_changes)
    end
    changes
  end
end

namespace :slack do
  desc 'Export users info'
  task :export_users, ['user_ids'] => :environment do |_task, args|
    SlackUserExporter.new(args.to_a).run
  end

  namespace :billing_changes do
    desc 'Crawl billing/changes page'
    task :crawl => :environment do
      require 'csv'

      driver = Selenium::WebDriver.for :chrome
      driver.get 'https://splathon.slack.com/admin'
      sleep(3)
      driver.find_element(id: 'email').send_keys(ENV['SLACK_LOGIN_EMAIL'])
      driver.find_element(id: 'password').send_keys(ENV['SLACK_LOGIN_PASSWORD'])
      driver.find_element(id: 'signin_btn').click

      scraper = BillingChangeScraper.new(driver)
      user_changes = scraper.scrape

      CSV.open("billing_change_#{Time.now.to_i}.csv", "w") do |csv|
        user_changes.each do |row|
          csv << row.values_at(:detected_on, :member_id, :display_name, :action)
        end
      end
    end
  end
end

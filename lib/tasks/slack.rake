namespace :slack do
  desc 'Export users info'
  task :export_users, ['user_ids'] => :environment do |_task, args|
    SlackUserExporter.new(args.to_a).run
  end

  namespace :billing_changes do
    desc 'Crawl billing/changes page'
    task :crawl => :environment do
      agent = Mechanize.new
      page = agent.get('https://splathon.slack.com/')
      page.form.email = ENV['SLACK_LOGIN_EMAIL']
      page.form.password = ENV['SLACK_LOGIN_PASSWORD']
      page.form.submit

      scraper = BillingChangeScraper.new(agent)
      user_changes = scraper.scrape

      user_changes.each do |user_change|
        record = SlackBillingChange.find_or_create_by(user_change.attributes.slice('detected_on', 'member_id', 'action')) do |r|
          r.display_name = user_change.attributes['display_name']
        end

        record.display_name = user_change.attributes['display_name']
        record.save! if record.will_save_change_to_display_name?
      end
    end
  end
end

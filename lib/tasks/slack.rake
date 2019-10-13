namespace :slack do
  desc 'Export users info'
  task :export_users, ['user_ids'] => :environment do |_task, args|
    SlackUserExporter.new(args.to_a).run
  end
end

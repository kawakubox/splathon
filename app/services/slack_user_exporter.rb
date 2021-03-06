# frozen_string_literal: true

require 'csv'

class SlackUserExporter
  def initialize(user_ids = [])
    @client = Slack::Web::Client.new
    @user_ids = user_ids
  end

  def run
    users = @client.users_list['members'].map do |member|
      id = member['id']
      name = member['name']
      real_name = member['real_name']
      profile = member['profile']

      next unless @user_ids.include?(id)

      puts "#{id} #{name} 取得中"

      image_path = extract_image_path(profile)
      download_icon(id, image_path) 

      [id, name, real_name, image_path]
    end.compact

    ::CSV.open('./export/users/slack_users.csv', 'wb', col_sep: "\t", headers: %i(id name real_name image_path), write_headers: true) do |csv|
      users.each { |user| csv << user }
    end
  end

  def extract_image_path(profile)
    %w(image_24 image_32 image_48 image_72 image_192 image_512 image_1024)
      .reverse
      .map { |attr| profile.dig(attr) }
      .compact
      .first
  end

  def download_icon(id, image_path)
    uri = URI.parse(image_path)
    params = URI.decode_www_form(uri.query).to_h if uri.query
    sleep(1)

    conn = Faraday.new(url: image_path) do |faraday|
      faraday.use FaradayMiddleware::FollowRedirects
      faraday.adapter :net_http
    end
    response = conn.get uri.path, params
    ext = guess_extension(response.body)

    open("./export/users/images/#{id}.#{ext}", 'wb') do |file|
      file.write(response.body)
    end
  end

  def guess_extension(contents)
    mime = MimeMagic.by_magic(contents)
    mime.type.split('/').last
  end
end

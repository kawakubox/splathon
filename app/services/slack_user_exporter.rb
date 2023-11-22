# frozen_string_literal: true

require 'csv'

class SlackUserExporter
  def initialize(user_ids = [])
    @client = Slack::Web::Client.new
    @user_ids = user_ids
  end

  def run
    FileUtils.mkdir_p('./export/users/images')

    users = @user_ids.map do |id|
      response = @client.users_info(user: id)

      unless response['ok']
        puts "Failed fetch user [#{id}]"
        next
      end

      id = response.user.id
      name = response.user.name
      real_name = response.user.real_name
      profile = response.user.profile

      puts "#{id} #{name} 取得中"

      image_path = extract_image_path(profile)

      unless image_path
        puts "Profile image is not found [#{image_path}]"
      end

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

    file_path = "./export/users/images/#{id}.#{ext}"
    open(file_path, 'wb') do |file|
      file.write(response.body)
    end

    unless File.exist?(file_path)
      puts "File is not exist [#{file_path}]"
    end
  end

  def guess_extension(contents)
    mime = MimeMagic.by_magic(contents)
    mime.type.split('/').last
  end
end

require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.development? || Rails.env.test? 
    config.storage = :file
  elsif Rails.env.production?
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_directory  = 'match-hike1'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ID'],
      aws_secret_access_key: ENV['AWS_SECRET'],
      region: 'ap-northeast-1',
      path_style: true
    }
    config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" }
  end
end
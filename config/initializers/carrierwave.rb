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
    # config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/match-hike'
    config.asset_host = 'https://match-hike1.s3.amazonaws.com'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region: 'ap-northeast-1'
    }
    config.fog_public     = false
    config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" }
  end
end  
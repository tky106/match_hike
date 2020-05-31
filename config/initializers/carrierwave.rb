unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region: 'ap-northeast-1'
    }
    when 'production'
      config.fog_directory  = 'match-hike'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/match-hike'
      config.cache_storage = :fog
    end  
  end
end
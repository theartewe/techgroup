CarrierWave.configure do |config|
  config.cache_dir = File.join(Rails.root, 'tmp', 'uploads')
  config.storage = :fog

  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => ENV['S3_KEY'],
    :aws_secret_access_key  => ENV['S3_SECRET']
  }

  case Rails.env.to_sym
  when :development
    config.fog_directory = 'techgroup-media'
    config.fog_host       = '//techgroup-media.s3.amazonaws.com'
  when :production
    config.fog_directory = 'techgroup-media'
    config.fog_host       = '//techgroup-media.s3.amazonaws.com'
  end
end

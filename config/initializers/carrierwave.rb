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
    config.fog_directory = 'levant.media'
    config.fog_host       = 'http://levant.media.s3.amazonaws.com'
  when :production
    config.fog_directory = 'levant.media'
    config.fog_host       = 'http://levant.media.s3.amazonaws.com'
    #config.fog_host       = 'http://cdn.media.madegoods.com'
    #config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  end
end

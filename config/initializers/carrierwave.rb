CarrierWave.configure do |config|
  config.cache_dir = File.join(Rails.root, 'tmp', 'uploads')
  config.storage = :fog

  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'AKIAJ3OTSUW3BWO7IXDA',
    :aws_secret_access_key  => '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'
  }

  case Rails.env.to_sym
  when :development
    #config.storage = :file
    config.fog_directory = 'techgroup-media'
    config.fog_host       = '//techgroup-media.s3.amazonaws.com'
  when :production
    config.fog_directory = 'techgroup-media'
    config.fog_host       = '//d2b6zofzbz0sn1.cloudfront.net'
  end
end

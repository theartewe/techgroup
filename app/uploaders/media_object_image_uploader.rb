class MediaObjectImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  def store_dir
    "media-images/#{model.id}"
  end
  
  version :thumbnail do
    process :resize_to_fill => [200, 200]
    process :quality => 80
  end
end

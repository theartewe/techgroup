class ClientImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  def store_dir
    "client-images/#{model.id}"
  end
  
  version :thumbnail do
    process :resize_to_fill => [290, 156]
    process :quality => 80
  end
end

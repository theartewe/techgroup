class SlideImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  
  def store_dir
    "slide-images/#{model.id}"
  end

  version :thumb do
    process :resize_to_fill => [290, 156]
    process :quality => 80
  end
  
  version :full do
    process :resize_to_fill => [1500, 703]
    process :quality => 80
  end
end

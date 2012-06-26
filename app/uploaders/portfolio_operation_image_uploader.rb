class PortfolioOperationImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  def store_dir
    "portfolio-operation-images/#{model.id}"
  end
  
  version :thumbnail do
    process :resize_to_fill => [300, 246]
    process :quality => 80
  end
end

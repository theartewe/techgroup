class PortfolioOperationImageUploader < CarrierWave::Uploader::Base
  def store_dir
    "portfolio-operation-images/#{model.id}"
  end
  
  version :thumbnail do
    process :resize_to_fill => [232, 189]
    process :quality => 80
  end
end

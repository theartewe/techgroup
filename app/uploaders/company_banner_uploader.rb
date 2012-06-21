class CompanyBannerUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  def store_dir
    "company-banners/#{model.id}"
  end
  
  version :banner do
    process :resize_to_fill => [1240, 375]
    process :quality => 80
  end
  

end

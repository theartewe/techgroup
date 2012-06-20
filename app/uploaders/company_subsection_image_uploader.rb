class CompanySubsectionImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  def store_dir
    "company_subsection_images/#{model.id}"
  end
  
  version :thumbnail do
    process :resize_to_fill => [232, 124]
    process :quality => 60
  end
  

end

class CompanySubsectionImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  def store_dir
    "company_subsection_images/#{model.id}"
  end

end

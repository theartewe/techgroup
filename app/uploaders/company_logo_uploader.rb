class CompanyLogoUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  def store_dir
    "company_logos/#{model.id}"
  end
end

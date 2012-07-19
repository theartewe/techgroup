class CompanyBrochureUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  def store_dir
    "company-brochure/#{model.id}"
  end
end

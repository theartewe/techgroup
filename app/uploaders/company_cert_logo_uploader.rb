class CompanyCertLogoUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  def store_dir
    "company_cert_logos/#{model.id}"
  end

  version :cert_logo do
    process :resize_to_fill => [120, 120]
    process :quality => 80
  end
end

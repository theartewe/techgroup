class MediaObjectPdfUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  def store_dir
    "media-pdf/#{model.id}"
  end
end

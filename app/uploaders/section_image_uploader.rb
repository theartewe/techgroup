class SectionImageUploader < CarrierWave::Uploader::Base
  def store_dir
    "section-images/#{model.id}"
  end
end

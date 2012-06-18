class SlideImageUploader < CarrierWave::Uploader::Base
  def store_dir
    "slide-images/#{model.id}"
  end
end

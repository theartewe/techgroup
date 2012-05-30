class GalleryImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  def store_dir
    "gallery/#{model.id}"
  end

  version :thumbnail do
    process :resize_to_fill => [200, 160]
    process :quality => 60
  end

  version :optimized do
    process :resize_by_width => 540
    process :quality => 90
  end

  def resize_by_width(width)
    manipulate! do |img|
      img.resize_to_fit!(width, 0)
    end
  end
end

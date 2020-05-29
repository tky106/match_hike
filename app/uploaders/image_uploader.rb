class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog
  # def default_url(*args)
  #   "/image/23/" + [thumb20, "default.png"].compact.join('_')
  # end
  def default_url(*args)
    "default.jpg"
  end
  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  process :resize_to_limit => [100, 100]

  version :thumb do
    process resize_to_fill: [100, 100]
  end

  version :thumb20 do
    process resize_to_fill: [100, 100]
  end
end

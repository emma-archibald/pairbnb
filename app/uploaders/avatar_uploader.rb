class AvatarUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  include CarrierWave::MiniMagick
  # storage :file
  storage :fog

  version :large do
    process resize_to_limit: [800, 800]
  end

  version :medium, :from_version => :large do
    process resize_to_limit: [500, 500]
  end

  version :thumb, :from_version => :medium do
    process resize_to_fit: [100, 100]
  end

  version :square do
    process :resize_to_fit => [300, 300]
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end



  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end




end

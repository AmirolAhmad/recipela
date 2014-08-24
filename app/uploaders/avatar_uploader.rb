class MediaUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file

  def store_dir
    'public/my/upload/directory'
  end

  def cache_dir
    '/tmp/recipela-avatar'
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  process :resize_to_fit => [800, 800]

  version :thumb do
    process :resize_to_fill => [280,280]
  end

  version :small_thumb, :from_version => :thumb do
    process resize_to_fill: [20, 20]
  end
end
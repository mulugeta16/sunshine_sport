include CarrierWave::MiniMagick
version :thumb do
  process :resize_to_fit => [50, 50]
end

# encoding: utf-8

class FileUploader < CarrierWave::Uploader::Base

  include CarrierWave::MimeTypes
  include ActionView::Helpers::NumberHelper
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :set_content_type
  process :store_file_attributes

  private

  def store_file_attributes
    if file && model
      model.file_name  = File.basename(file.file)
      model.file_size  = File.size(file.file)
      model.human_size = number_to_human_size(model.file_size)
    end
  end

end

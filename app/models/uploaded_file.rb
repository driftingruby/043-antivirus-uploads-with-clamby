class UploadedFile < ApplicationRecord
  mount_uploader :file, FileUploader
  validate :scan_for_viruses, :if => lambda { self.file_changed? }
  validates :file, presence: true
  private

  def scan_for_viruses
    path = self.file.path
    unless Clamby.safe?(path)
      File.delete(path)
      self.errors.add(:file, "Virus Found." )
    end
  end
end

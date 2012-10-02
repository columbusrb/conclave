class UploadedFile < ActiveRecord::Base
  belongs_to :comment, inverse_of: :uploaded_files
  validates_presence_of :comment
  attr_protected # Whitelist all attributes

  if defined?(AdminSetting)
    has_attached_file :file,
      storage: :s3,
      s3_credentials: AdminSetting.paperclip_settings,
      styles: {thumb: "100x100>"}

    validates_attachment_size :file, less_than: 500.kilobytes,
                                     unless: Proc.new {|m| m[:image].nil?}
  end


end

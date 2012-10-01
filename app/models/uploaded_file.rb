class UploadedFile < ActiveRecord::Base
  belongs_to :comment
  validates_presence_of :comment
  attr_protected # Whitelist all attributes

  has_attached_file :file,
    storage: :s3,
    s3_credentials: AdminSetting.paperclip_settings,
    styles: {thumb: "100x100>"}

end

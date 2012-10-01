class AdminSetting < ActiveRecord::Base
  attr_protected # whitelist all attributes

  class << self

    def paperclip_settings
      if Rails.env.test?
        # We shouldn't hit AWS during testing, so no need to load settings
        {access_key_id: "", secret_access_key: "", bucket: ""}
      else
        @paperclip_settings ||= {
          access_key_id:     find_by_setting('aws_access_key').value,
          secret_access_key: find_by_setting('aws_secret_key').value,
          bucket:            find_by_setting("aws_bucket_#{Rails.env}").value
        }
      end
    end

  end

end

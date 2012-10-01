class AdminSetting < ActiveRecord::Base
  attr_protected # whitelist all attributes

  class << self

    def paperclip_settings
      {
        access_key_id:     find_by_setting('aws_access_key').try(:value),
        secret_access_key: find_by_setting('aws_secret_key').try(:value),
        bucket:            find_by_setting("aws_bucket_#{Rails.env}").try(:value)
      }
    end

    def oauth_settings_for(provider)
      key    = find_by_setting("#{provider}_oauth_key").try(:value)
      secret = find_by_setting("#{provider}_oauth_secret").try(:value)
      {key: key, secret: secret} if key && secret
    end

  end

end

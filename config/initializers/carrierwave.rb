if Rails.env == 'production'
  CarrierWave.configure do |config|
    config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => AdminSetting.find_by_setting('aws_access_key').value,
      :aws_secret_access_key  => AdminSetting.find_by_setting('aws_secret_key').value,
      :region                 => 'us-east-1'
    }
    config.fog_directory = AdminSetting.find_by_setting('aws_bucket_production').value
    config.fog_public     = true
    config.fog_attributes = {'Cache-Control' => 'max-age=315576000'}
  end
end
require 'spec_helper'

describe AdminSetting do
  before do
    %w{aws_access_key aws_secret_key aws_bucket_development aws_bucket_production}.each do |k|
      AdminSetting.create do |a|
        a.setting = k
        a.value = "TEST"
      end
    end
  end

  describe "self.paperclip_settings" do
    before do
      # We don't need Paperclip in :test
      Rails.stub(env: ActiveSupport::StringInquirer.new("production"))
    end

    it "should return actual values" do
      AdminSetting.paperclip_settings.should == {access_key_id: "TEST", secret_access_key: "TEST", bucket: "TEST"}
    end
  end

  describe "self.oauth_settings_for" do
    describe "when the key and secret are present" do
      before do
        %w{twitter_oauth_key twitter_oauth_secret}.each do |k|
          AdminSetting.create do |a|
            a.setting = k
            a.value   = "TEST"
          end
        end
      end

      it "should return the appropriate hash" do
        AdminSetting.oauth_settings_for(:twitter).should == {key: "TEST", secret: "TEST"}
      end
    end

    describe "when the key and secret are not present" do
      it "should return the appropriate hash" do
        AdminSetting.oauth_settings_for(:twitter).should == nil
      end
    end
  end
end

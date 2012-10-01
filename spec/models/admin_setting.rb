require 'spec_helper'

describe AdminSetting do
  before do
    %w{aws_access_key aws_secret_key aws_bucket_development aws_bucket_production}.each do |k|
      a = AdminSetting.new
      a.setting = k
      a.value = "TEST"
      a.save!
    end
  end

  describe "self.paperclip_settings" do
    describe "when in the test env" do
      it "should return blank values" do
        AdminSetting.paperclip_settings.should == {access_key_id: "", secret_access_key: "", bucket: ""}
      end
    end

    describe "when not in the test env" do
      before do
        Rails.stub(env: ActiveSupport::StringInquirer.new("production"))
      end

      it "should return actual values" do
        AdminSetting.paperclip_settings.should == {access_key_id: "TEST", secret_access_key: "TEST", bucket: "TEST"}
      end
    end
  end
end

require 'spec_helper'

describe UploadedFile do
  before do
    @uploaded_file = FactoryGirl.create(:uploaded_file)
  end

  it "should be valid" do
    @uploaded_file.valid?.should be_true
  end

  describe "validations" do
    it "should require a comment" do
      @uploaded_file.comment = nil
      @uploaded_file.valid?.should be_false
    end
  end

  describe "associations" do
    it "should know about its Comment" do
      @uploaded_file.respond_to?(:comment).should be_true
    end
  end
end

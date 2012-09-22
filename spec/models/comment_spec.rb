require 'spec_helper'

describe Comment do
  before do
    @comment = FactoryGirl.create(:comment)
  end

  it "should be valid" do
    @comment.valid?.should be_true
  end

  describe "validations" do
    it "should require a user" do
      @comment.user = nil
      @comment.valid?.should be_false
    end

    it "should require a conversation" do
      @comment.conversation = nil
      @comment.valid?.should be_false
    end
  end

  describe "associations" do
    it "should know about its Conversation" do
      @comment.respond_to?(:conversation).should be_true
    end
  end

  it "should sort by created_at" do
    c2 = FactoryGirl.create(:comment)
    c3 = FactoryGirl.create(:comment)
    Comment.all.should == [@comment, c2, c3]
  end
end

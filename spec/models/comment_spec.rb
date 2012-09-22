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

  describe "accessible attributes" do
    it "should allow :content" do
      new_content = "Something Else"
      @comment.update_attributes({:content => new_content})
      @comment.content.should == new_content
    end

    it "should allow :conversation_id" do
      conversation = FactoryGirl.create(:conversation)
      @comment.update_attributes({:conversation_id => conversation.id})
      @comment.conversation.should == conversation
    end

    it "should allow :user_id" do
      user = FactoryGirl.create(:user)
      @comment.update_attributes({:user_id => user.id})
      @comment.user.should == user
    end
  end


  it "should sort by created_at" do
    c2 = FactoryGirl.create(:comment)
    c3 = FactoryGirl.create(:comment)
    Comment.all.should == [@comment, c2, c3]
  end
end

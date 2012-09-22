require 'spec_helper'

describe Conversation do
  before do
    @conversation = FactoryGirl.create(:conversation)
  end

  it "should be valid" do
    @conversation.valid?.should be_true
  end

  describe "associations" do
    it "should know about any related Comments" do
      @conversation.comments.should == []
    end
  end

  describe "validations" do
    it "should require a Forum" do
      @conversation.forum = nil
      @conversation.valid?.should be_false
    end
  end

  describe "accessible attributes" do
    it "should allow :title" do
      new_title = "Something Else"
      @conversation.update_attributes({:title => new_title})
      @conversation.title.should == new_title
    end

    it "should allow :forum_id" do
      forum = FactoryGirl.create(:forum)
      @conversation.update_attributes({:forum_id => forum.id})
      @conversation.forum.should == forum
    end
  end

  it "should know about its original author" do
    u1 = FactoryGirl.create(:user)
    u2 = FactoryGirl.create(:user)
    c1 = FactoryGirl.create(:comment, :user => u1)
    c2 = FactoryGirl.create(:comment, :user => u2)
    @conversation.comments << c1
    @conversation.comments << c2

    @conversation.original_author.should == u1
  end
end

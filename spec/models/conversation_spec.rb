require 'spec_helper'

describe Conversation do
  before do
    @conversation = FactoryGirl.create(:conversation)
  end

  it "should know about any related Comments" do
    @conversation.comments.should == []
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

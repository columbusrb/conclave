require 'spec_helper'

describe Comment do
  before do
    @comment = FactoryGirl.create(:comment)
  end

  it "should know about its Conversation" do
    @comment.respond_to?(:conversation).should be_true
  end

  it "should sort by created_at" do
    c2 = FactoryGirl.create(:comment)
    c3 = FactoryGirl.create(:comment)
    Comment.all.should == [@comment, c2, c3]
  end
end

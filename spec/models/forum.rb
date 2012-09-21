require 'spec_helper'

describe Forum do
  before do
    @forum = FactoryGirl.create(:forum)
  end

  it "should know about any related Conversations" do
    @forum.conversations.should == []
  end
end

require 'spec_helper'

describe ConversationsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new', :forum_id => 1
      response.should be_success
    end
  end

end

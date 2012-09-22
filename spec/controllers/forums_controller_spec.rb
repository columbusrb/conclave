require 'spec_helper'

describe ForumsController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      Forum.should_receive(:find).with("1").and_return(create(:forum))
      get 'show', :id => 1
      response.should be_success
    end
  end

end

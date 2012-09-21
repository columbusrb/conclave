require 'spec_helper'

describe TopicsController do

  before (:each) do
    @topic = FactoryGirl.create(:topic)
  end

  describe "GET 'index'" do
    it "returns http success" do
      get :index
      response.should be_success
    end
  end

  describe "GET 'show' by slug" do
    it "returns http success" do
      get :show, id: @topic.slug
      response.should be_success
    end
  end

end

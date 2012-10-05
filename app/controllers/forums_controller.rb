class ForumsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @forums = Forum.all
  end

  def show
    @forum         = Forum.find(params[:id])
    @conversations = @forum.conversations
  end
end

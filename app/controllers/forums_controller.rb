class ForumsController < ApplicationController
  def index
    @forums = Forum.all
  end

  def show
    @forum                 = Forum.find(params[:id])
    @sticky_conversations  = @forum.conversations.sticky
    @regular_conversations = @forum.conversations.regular
  end
end

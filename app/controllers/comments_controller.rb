class CommentsController < ApplicationController
  def index
    @conversation = Conversation.find(params[:conversation_id])
    @comments = @conversation.comments
  end
end

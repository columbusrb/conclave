class ConversationsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @forum         = Forum.find(params[:forum_id])
    @conversation  = @forum.conversations.build
    @comment       = @conversation.comments.build
    @uploaded_file = @comment.uploaded_files.build
  end

  def create
    @forum        = Forum.find(params[:forum_id])
    @conversation = @forum.conversations.build(params[:conversation])

    if @conversation.save
      redirect_to conversation_comments_path(@conversation)
    else
      # It seems that this gets lost...
      @conversation.comments.first.uploaded_files.build
      render action: "new"
    end
  end
end

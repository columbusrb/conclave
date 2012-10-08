class CommentsController < ApplicationController
  respond_to :js

  def new
    @conversation = Conversation.find(params[:conversation_id])
    @comment      = @conversation.comments.build
  end

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @comment      = @conversation.comments.create!(params[:comment])
    render partial: "comments/comment", locals: {conversation: @conversation, comment: @comment}
  end

  def edit
    @conversation = Conversation.find(params[:conversation_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      redirect_to conversation_path(@comment.conversation), notice: "Comment was successfully updated"
    else
      render action: 'edit'
    end
  end
end

class CommentsController < ApplicationController
  respond_to :js

  def new
    @conversation = Conversation.find(params[:conversation_id])
    @comment      = @conversation.comments.build
  end

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @comment      = @conversation.comments.build(params[:comment])
    if @comment.save
      redirect_to conversation_path(@conversation)
    else
      redirect_to conversation_path(@conversation)
    end
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

  def redact
    @comment = Comment.find(params[:id])
    @comment.redacted = true
    @comment.redactor = current_user
    @comment.redacted_at = Time.now.utc
    if @comment.save
      redirect_to conversation_path(@comment.conversation, anchor: "comment_#{@comment.id}"), notice: "Comment Redacted"
    else
      redirect_to conversation_path(@comment.conversation), notice: "Could not redact comment."
    end
  end

  def unredact
    @comment = Comment.find(params[:id])
    @comment.redacted = false
    @comment.redactor = nil
    @comment.redacted_at = nil
    if @comment.save
      redirect_to conversation_path(@comment.conversation, anchor: "comment_#{@comment.id}"), notice: "Un-redacted comment"
    else
      redirect_to conversationPath(@comment.conversation), notice: "Could not unredact comment"
    end
  end
end

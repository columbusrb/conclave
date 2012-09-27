class ConversationsController < ApplicationController
  before_filter :authenticate_user!
  def new
    @conversation = forum.conversations.new
    @conversation.comments.build
  end

  def create
    params[:conversation][:comments_attributes].each {|c| c[1].merge!(user_id: current_user.id)}
    @conversation = forum.conversations.new(params[:conversation])
    @conversation.creator = current_user

    if @conversation.save!
      redirect_to conversation_comments_path(@conversation)
    else
      render action: "new"
    end
  end

  protected

  def forum
    @forum ||= Forum.find(params[:forum_id])
  end
end

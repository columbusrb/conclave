class WatchesController < ApplicationController

  def create
    conversation = Conversation.find(params[:conversation_id])
    current_user.watch!(conversation)
    redirect_to :back
  end

  def destroy
    conversation = Conversation.find(params[:conversation_id])
    current_user.unwatch!(conversation)
    redirect_to :back
  end

end

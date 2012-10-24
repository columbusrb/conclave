ActiveAdmin.register Conversation do

  filter :forum
  filter :creator
  filter :sticky, as: :select
  filter :closed, as: :select
  filter :title

  controller do
    def update
      @conversation = Conversation.find(params[:id])
      @conversation.assign_attributes(params[:conversation], without_protection: true)

      if @conversation.forum_id_changed?
        old_forum = Forum.find(@conversation.forum_id_was)
        new_forum = Forum.find(@conversation.forum_id)
        Forum.decrement_counter(:conversations_count, old_forum.id)
        Forum.increment_counter(:conversations_count, new_forum.id)
      end

      if @conversation.save!
        redirect_to admin_conversation_path(@conversation)
      else
        render :edit
      end
    end
  end

  form do |f|
    f.inputs "Conversation Details" do
      f.input :forum
      f.input :creator
      f.input :title
      f.input :sticky
      f.input :closed
    end
    f.actions
  end
end

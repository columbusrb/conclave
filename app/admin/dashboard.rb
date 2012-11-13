ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        panel "Recent Posts" do
          ul do
            Conversation.limit(5).map do |post|
              li link_to(post.title, admin_conversation_path(post))
            end
          end
        end
        panel "Top 10 Posters" do
          ul do
            User.top_contributors(10).map do |user|
              li "#{link_to user.email, admin_user_path(user)} - #{user.comments.count} Comments".html_safe
            end
          end
        end
      end

      column do
        panel "Info" do
          para "Welcome to Conclave."
        end
        panel "Activity" do
          ul do
            li "Today: #{Comment.where("created_at > ?", Date.today.at_beginning_of_day).count}"
            li "Yesterday: #{Comment.where("created_at > ? AND created_at < ?", Date.yesterday.at_beginning_of_day, Date.today.at_beginning_of_day).count}"
            li "Last 7 Days: #{Comment.where("created_at > ?", 7.days.ago.at_beginning_of_day).count}"
            li "All Time: #{Comment.count}"
          end
        end
      end
    end
  end # content
end

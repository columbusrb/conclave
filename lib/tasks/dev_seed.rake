namespace :db do
  namespace :development do

    task :reload => ['db:drop', 'db:setup', 'db:development:seed']

    desc 'Seeds development data'
    task :seed => [:environment, 'db:seed'] do
      puts "#{Time.zone.now} Creating development seed data"
      forum = Forum.first
      user  = User.first

      10.times do |i|
        forum.conversations.create do |c|
          c.title      = "Sticky Conversation #{i}"
          c.creator_id = user.id
          c.sticky     = true
        end
      end

      100.times do |i|
        forum.conversations.create do |c|
          c.title      = "Conversation #{i}"
          c.creator_id = user.id
        end
      end

      40.times do |i|
        forum.conversations.create do |c|
          c.title      = "closed Conversation #{i}"
          c.creator_id = user.id
          c.closed     = true
        end
      end

      Conversation.reset_column_information
      Conversation.find_each do |c|
        Conversation.update_counters c.id, comments_count: c.comments.count
      end

      puts "#{Time.zone.now} Development seed complete"
    end

  end
end

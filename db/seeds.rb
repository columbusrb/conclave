# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if User.count == 0
  puts 'SETTING UP DEFAULT USER LOGIN'
  user = User.create! :email => 'user@example.com', :password => 'please', :password_confirmation => 'please'
  puts 'New user created: ' << user.email
  user2 = User.create! :email => 'user2@example.com', :password => 'please', :password_confirmation => 'please'
  puts 'New user created: ' << user2.email
  puts "Setting up Admin Account"
  admin = User.create!(:email => 'admin@example.com', :password => 'password')
  admin.update_attribute(:role, 'admin')
  puts "Admin created: #{admin.email}"
end

if Forum.count == 0
  puts "Creating a default forum"
  f = Forum.create! :title => "On Topic"
end

if AdminSetting.count == 0
  puts "Creating default Admin Settings"
  %w{aws_access_key aws_secret_key aws_bucket_development
      aws_bucket_production}.each do |k|
    a = AdminSetting.new
    a.setting = k
    a.save!
  end
end

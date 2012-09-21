module UsersHelper
  def gravatar(user)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    image_tag "http://gravatar.com/avatar/#{gravatar_id}.png?s=48"
  end
end

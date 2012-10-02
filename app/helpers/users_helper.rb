module UsersHelper
  def gravatar(user, options = { size: 50 })
    gravatar_id  = Digest::MD5::hexdigest(user.email.downcase)
    size         = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.email, class: "avatar")
  end

  def avatar(user, options={})
    if user.provider.present?
      image_tag("http://avatars.io/#{user.provider}/#{user.nickname}", class: 'avatar')
    else
      gravatar(user, options)
    end
  end
end

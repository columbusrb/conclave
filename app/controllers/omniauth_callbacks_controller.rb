class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def twitter
    login
  end

  def facebook
    login
  end

  protected

  def login
    user = user_from_social_media

    check_for_banned_user(user) do
      sign_in_and_redirect user, :event => :authentication
    end
  end

  def user_from_social_media
    User.find_or_create_with_social_media_account(oauth_hash)
  end

  def oauth_hash
    request.env['omniauth.auth']
  end

  def oauth_params
    request.env['omniauth.params']
  end
end

class SessionsController < Devise::SessionsController

  def create
    user = User.find_by_email(params[:user][:email])

    check_for_banned_user(user) do
      super
    end
  end

end

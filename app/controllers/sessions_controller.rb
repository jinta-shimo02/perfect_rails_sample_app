class SessionsController < ApplicationController
  skip_before_action :authenticate, only: %i[create]
  def create
    # 「request.env["omniauth.auth"]」はOmniAuth::AuthHashというクラスのオブジェクトで、Githubから渡されたユーザー情報や、OAuthのアクセストークンが格納されている。
    user = User.find_or_create_from_auth_hash!(request.env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_path, notice: "ログインしました"
  end

  def destroy
    reset_session
    redirect_to root_path, notice: "ログアウトしました"
  end
end

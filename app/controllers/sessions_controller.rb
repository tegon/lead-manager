class SessionsController < ApplicationController
  def new
    redirect_to leads_path if current_user
  end

  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by(uid: auth["uid"]) || User.create_with_salesforce(auth)
    session[:user_id] = user.id
    redirect_to leads_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
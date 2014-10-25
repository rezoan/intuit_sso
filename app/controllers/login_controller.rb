class LoginController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:callback]

  def index
  end

  def callback
    if user = User.find_for_open_id(request.env["omniauth.auth"])
      session[:user_id] = user.id
      redirect_to start_index_url
    else
      redirect_to root_url, notice: 'Auth fail'
    end
  end
end

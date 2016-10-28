class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:login][:email])
    if @user && @user.authenticate(params[:login][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      @error = ["Email and password combination not found."]
      render new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private
  def sesh_params
    params.permit(:email,:password)
  end
end

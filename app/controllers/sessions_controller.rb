class SessionsController < ApplicationController
  def new
  end

  def create
    # Checks if user is Customer or Business
    @user = Customer.find_by(username: params[:session][:username])
    if @user.nil?
      @user = Business.find_by(username: params[:session][:username])
    end

    if @user && @user.authenticate(params[:session][:password])
      login @user
      redirect_to root_url
    else
      @user = nil
      @errors = ['Username and password combination do not match']
      render :new
    end
  end

  def destroy
    logout
    redirect_to login_path
  end
end

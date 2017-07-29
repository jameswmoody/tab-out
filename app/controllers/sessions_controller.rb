class SessionsController < ApplicationController
  def new
  end

  def create

    @customer = Customer.find_by(username: params[:session][:username])
    if @customer && @customer.authenticate(params[:session][:password])
      login @customer
      redirect_to root_url
    else
      @customer = nil
      @errors = ['Username and password combination do not match']
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_url
  end
end

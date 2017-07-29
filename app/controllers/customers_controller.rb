class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save && params[:customer][:password] == params[:customer][:password_confirmation]
      login @customer
      redirect_to cards_new_path
    else
      @errors = @customer.errors.full_messages
      render :new
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:username, :password, :password_confirmation, :first_name, :last_name, :email, :phone)
  end
end

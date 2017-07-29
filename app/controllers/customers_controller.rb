class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    p customer_params
    @customer = Customer.new(customer_params)

    if @customer.save
      redirect_to new_card_path
    else
      p 'error'
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:username, :password, :password_confirmation, :first_name, :last_name, :email, :phone)
  end
end

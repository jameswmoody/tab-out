class CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
    @recent_tabs = @customer.tabs.order("updated_at DESC").limit(3)
    @open_tabs = @customer.tabs.where(transaction_id: nil)
    p @open_tabs
  end

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

  def edit
    @customer = current_user
    @client_token = CreditCardService.new(customer: current_user).generate_token(vault_id: current_user.vault_id)
  end

  def update
    p params
  end

  private
  def customer_params
    params.require(:customer).permit(:username, :password, :password_confirmation, :first_name, :last_name, :email, :phone)
  end
end

class CardsController < ApplicationController
  def new
    redirect_to root_path and return unless logged_in?
    @client_token = CreditCardService.new().generate_token()
  end

  def create
    @customer = current_user

    payment_params = params[:card]
    result = CreditCardService.new({customer: @customer}).create_customer(payment_params)

    if result.success?
      @customer.vault_id = result.customer.id
      @customer.save
      redirect_to root_url
    else
      @errors = ["Card is not valid - please check that it was submitted correctly"]
      @client_token = CreditCardService.new().generate_token()
      render '/cards/new'
    end
  end

  def edit
    redirect_to root_path and return unless logged_in?
    @client_token = CreditCardService.new(customer: current_user).generate_token(vault_id: current_user.vault_id)
  end
end

class CardsController < ApplicationController
  def new
    @client_token = CreditCardService.new({customer: @customer}).generate_token()
  end

  def create
    @customer = Customer.last

    payment_params = params[:card]
    result = CreditCardService.new({customer: @customer}).create_customer(payment_params)

    @customer.vault_id = result.customer.id
    @customer.save
    redirect_to root_url
  end
end

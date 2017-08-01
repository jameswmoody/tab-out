class CardsController < ApplicationController
  def new
    @client_token = CreditCardService.new({customer: @customer}).generate_token()
  end

  def create
    @customer = Customer.last

    payment_params = params[:card]
    result = CreditCardService.new({customer: @customer}).create_customer(payment_params)

    if result.success?
      @customer.vault_id = result.customer.id
      @customer.save
      redirect_to root_url
    else
      p result
      @errors = ["Card is not valid - please check that it was submitted correctly"]
      @client_token = CreditCardService.new({customer: @customer}).generate_token()
      render '/cards/new'
    end
  end
end

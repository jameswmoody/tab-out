class TransactionsController < ApplicationController
  def index
  end

  def new
    @customer = Customer.new({username: 'nico', first_name:'nico', last_name: 'glennon', email: 'n@n.com', phone: '1234567', :password_digest => '12345', vault_id: '123456'})
    @client_token = CreditCardService.new({customer: @customer}).generate_token
  end

  def create
    @customer = Customer.new({username: 'nico', first_name:'nico', last_name: 'glennon', email: 'n@n.com', phone: '1234567', password_digest: '123456', vault_id: '123456'})

    p @customer

    payment_params = params[:transaction]

    result = CreditCardService.new({customer: @customer}).create_transaction('57.12')

    p result

    redirect_to '/transactions/new'
  end
end

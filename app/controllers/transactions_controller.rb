class TransactionsController < ApplicationController
  def index
  end

  def new
    @client_token = Braintree::ClientToken.generate()
  end

  def create
    nonce = params[:transaction][:nonce]

    result = Braintree::Transaction.sale(
      :amount => "10.00",
      :payment_method_nonce => nonce,
      :options => {
        :submit_for_settlement => true
      }
    )
    redirect_to 'transactions/new'
  end
end

require 'braintree'

class CreditCardService

  def initialize(params={})
    @customer = params[:customer]
  end

  def create_transaction(amount)
    result = Braintree::Transaction.sale(
      :amount => amount,
      :customer_id => @customer.vault_id,
      :options => {
        :submit_for_settlement => true
      }
    )
  end

  def generate_token(params={})
    if params[:vault_id]
      Braintree::ClientToken.generate(:customer_id => params[:vault_id])
    else
      Braintree::ClientToken.generate()
    end
  end

  def create_customer(payment_params)
    result = Braintree::Customer.create(
      :first_name => @customer.first_name,
      :last_name => @customer.last_name,
      :email => @customer.email,
      :phone => @customer.phone,
      :credit_card => {
        :payment_method_nonce => payment_params[:nonce],
        # :billing_address => {
        #   :first_name => payment_params[:first_name],
        #   :last_name => payment_params[:last_name],
        #   :street_address => payment_params[:street_address],
        #   :locality => payment_params[:city],
        #   :region => payment_params[:state],
        #   :postal_code => payment_params[:postal_code]
        # },
        :options => {
          :verify_card => true
        }
      }
    )
  end

  def add_payment_method(nonce)
    result = Braintree::PaymentMethod.create(
      :customer_id => @customer.vault_id,
      :payment_method_nonce => nonce,
      :options => {
        :verify_card => true
      }
    )
  end

end

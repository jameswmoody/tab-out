require 'rails_helper'

RSpec.describe CustomersController do
  let(:valid_customer) {
    {username: 'tomtom', password: 'tomtom', vault_id:'braintreesecret', first_name: 'tom', last_name:'tom', phone: '+13128675309', email:'tom@tom.com'}
  }
  let(:invalid_customer) {
    {username: '', password: '', vault_id:'', first_name: '', last_name:'', phone: '', email:''}
  }

  describe "GET new" do
    it "assigns @customer as new Customer" do
      get :new
      expect(assigns(:customer)).to be_a(Customer)
    end

    it "renders signup page" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "POST create" do
    context "when customer has valid params" do
      it "assigns customer as @customer" do
        post :create, params: {customer: valid_customer}
        expect(assigns(:customer)).to eq(Customer.last)
      end
    end

    context "when customer has invalid params" do
      it "assigns customer as @customer with valid params" do
        post :create, params: {customer: invalid_customer}
        expect(assigns(:customer)).to be_a(Customer)
      end
      it "re-renders signup page" do
        post :create, params: {customer: invalid_customer}
        expect(response).to render_template("new")
      end
    end
  end
end

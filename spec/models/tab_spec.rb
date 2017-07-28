require 'rails_helper'

RSpec.describe Tab, type: :model do
  before(:all) do
    customer = Customer.create(username: 'tomtom', password: 'tomtom', vault_id:'braintreesecret', first_name: 'tom', last_name:'tom', phone: '+13128675309', email:'tom@tom.com')
    business = Business.create(username: 'dugans_on_halsted', password:'dugans', sub_merchant_id:'braintreesecret', email:'dugans@dugans.com', doing_business_as:'Dugans')
    Tab.create(customer: customer, business: business)
  end
  after(:all) do
    Tab.destroy_all
    Customer.destroy_all
    Business.destroy_all
  end
  let(:tab) { Tab.first }
  let(:customer) { Customer.first }
  let(:business) { Business.first }
  describe "has" do
    it "a customer" do
      expect(tab.customer).to eq customer
    end
    it "a business" do
      expect(tab.business).to eq business
    end
    it "items" do
      item = Item.create(drink_type: 'Beer', price: 5700, tab: tab)

      expect(tab.items).to include item
    end
  end
  describe "total_price" do
    it "returns the aggragated price of the items on a tab" do
      Item.create(drink_type: 'Beer', price: 5700, tab: tab)
      Item.create(drink_type: 'Wine', price: 5700, tab: tab)
      expect(tab.total_price).to eq 11400
    end
  end
end

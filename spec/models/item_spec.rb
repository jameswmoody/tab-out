require 'rails_helper'

RSpec.describe Item, type: :model do
  before(:all) do
    customer = Customer.create(username: 'tomtom', password: 'tomtom', vault_id:'braintreesecret', first_name: 'tom', last_name:'tom', phone: '+13128675309', email:'tom@tom.com')
    business = Business.create(username: 'dugans_on_halsted', password:'dugans', sub_merchant_id:'braintreesecret', email:'dugans@dugans.com', doing_business_as:'Dugans')
    tab = Tab.create(customer: customer, business: business)
    Item.create(drink_type: 'Beer', price: 5700, tab: tab)
  end
  after(:all) do
    Item.destroy_all
    Tab.destroy_all
    Customer.destroy_all
    Business.destroy_all
  end
  let(:item) { Item.first }
  let(:tab) { Tab.first }
  describe "has" do
    it "a drink type" do
      expect(item.drink_type).to eq 'Beer'
    end
    it "a price" do
      expect(item.price).to eq 5700
    end
    it "a tab" do
      expect(item.tab).to eq tab
    end
  end
end

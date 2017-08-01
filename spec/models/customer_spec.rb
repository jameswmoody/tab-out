require 'rails_helper'

RSpec.describe Customer, type: :model do
  before(:all) do
    Customer.create(username: 'tomtom', password: 'tomtom', vault_id:'braintreesecret', first_name: 'tom', last_name:'tom', phone: '+13128675309', email:'tom@tom.com')
    Business.create(username: 'dugans_on_halsted', password:'dugans', sub_merchant_id:'braintreesecret', email:'dugans@dugans.com', doing_business_as:'Dugans')
  end
  after(:all) do
    Business.destroy_all
    Customer.destroy_all
  end
  let(:valid_customer) { Customer.first }
  describe "has" do
    it "a username" do
      expect(valid_customer.username).to eq 'tomtom'
    end
    it "a vault_id" do
      expect(valid_customer.vault_id).to eq 'braintreesecret'
    end
    it "a first name" do
      expect(valid_customer.first_name).to eq 'tom'
    end
    it "a last name" do
      expect(valid_customer.last_name).to eq 'tom'
    end
    it "a phone number" do
      expect(valid_customer.phone).to eq '+13128675309'
    end
    it "a password" do
      expect(valid_customer.authenticate('tomtom')).to be_truthy
    end
    it "an email" do
      expect(valid_customer.email).to eq 'tom@tom.com'
    end
  end
  describe "has validations" do
    let(:customer_no_username) { Customer.new(password: 'tomtom', vault_id:'braintreesecret', first_name: 'tom', last_name:'tom', phone: '+13128675309', email:'tom@tom.com') }
    let(:customer_no_phone) { Customer.new(username: 'tomtom', password: 'tomtom', vault_id:'braintreesecret', first_name: 'tom', last_name:'tom', email:'tom@tom.com') }
    let(:customer_no_first_name) { Customer.new(username: 'tomtom', password: 'tomtom', vault_id:'braintreesecret', last_name:'tom', phone: '+13128675309', email:'tom@tom.com') }
    let(:customer_no_last_name) { Customer.new(username: 'tomtom', password: 'tomtom', vault_id:'braintreesecret', first_name: 'tom', phone: '+13128675309', email:'tom@tom.com') }
    let(:customer_no_email) { Customer.new(username: 'tomtom', password: 'tomtom', vault_id:'braintreesecret', first_name: 'tom', last_name:'tom', phone: '+13128675309') }
    let(:customer_no_password) { Customer.new(username: 'tomtom', vault_id:'braintreesecret', first_name: 'tom', last_name:'tom', phone: '+13128675309', email:'tom@tom.com') }
    let(:customer_not_unique) { Customer.new(username: 'tomtom', password: 'tomtom', vault_id:'braintreesecret', first_name: 'tom', last_name:'tom', phone: '+13128675309', email:'tom@tom.com') }
    let(:customer_with_business_username) { Customer.new(username: 'dugans_on_halsted', password: 'tomtom', vault_id:'braintreesecret', first_name: 'tom', last_name:'tom', phone: '+13128675310', email:'tim@tom.com') }
    it "is invalid without a username" do
      expect(customer_no_username).to_not be_valid
    end
    it "is invalid without a phone number" do
      expect(customer_no_phone).to_not be_valid
    end
    it "is invalid without a first_name" do
      expect(customer_no_first_name).to_not be_valid
    end
    it "is invalid without a last_name" do
      expect(customer_no_last_name).to_not be_valid
    end
    it "is invalid without an email" do
      expect(customer_no_email).to_not be_valid
    end
    it "is invalid without a password" do
      expect(customer_no_password).to_not be_valid
    end
    it "is invalid with non unique information" do
      expect(customer_not_unique).to_not be_valid
    end
    it "is invalid with a business username" do
      expect(customer_with_business_username).to_not be_valid
    end
  end
end

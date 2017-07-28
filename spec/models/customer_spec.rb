require 'rails_helper'

RSpec.describe Customer, type: :model do
  before(:all) do
    Customer.create(username: 'tomtom', password: 'tomtom', vault_id:'braintreesecret', first_name: 'tom', last_name:'tom', phone: '+13128675309', email:'tom@tom.com')
  end
  after(:all) do
    Customer.destroy_all
  end
  let(:valid_customer) { Customer.first }
  let(:invalid_customer) { Customer.new }
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
  end
end

require 'rails_helper'

RSpec.describe Business, type: :model do
  before(:all) do
    Business.create(username: 'dugans_on_halsted', password:'dugans', sub_merchant_id:'braintreesecret', email:'dugans@dugans.com', doing_business_as:'Dugans')
  end
  after(:all) do
    Business.destroy_all
  end
  let(:business) { Business.first }
  describe "has" do
    it "a username" do
      expect(business.username).to eq 'dugans_on_halsted'
    end
    it "a sub_merchant_id" do
      expect(business.sub_merchant_id).to eq 'braintreesecret'
    end
    it "an email" do
      expect(business.email).to eq 'dugans@dugans.com'
    end
    it "a password" do
      expect(business.authenticate('dugans')).to be_truthy
    end
  end
  describe "has validations" do
    let(:business_no_username) { Business.new(password:'dugans', sub_merchant_id:'braintreesecret', email:'dugans@dugans.com', doing_business_as:'Dugans') }
    let(:business_no_sub_merchant_id) { Business.new(username: 'dugans_on_halsted', password:'dugans', email:'dugans@dugans.com', doing_business_as:'Dugans') }
    let(:business_no_email) { Business.new(username: 'dugans_on_halsted', password:'dugans', sub_merchant_id:'braintreesecret', doing_business_as:'Dugans') }
    let(:business_no_doing_business_as) { Business.new(username: 'dugans_on_halsted', password:'dugans', sub_merchant_id:'braintreesecret', email:'dugans@dugans.com') }
    let(:business_no_password) { Business.new(username: 'dugans_on_halsted', sub_merchant_id:'braintreesecret', email:'dugans@dugans.com', doing_business_as:'Dugans') }
    let(:business_not_unique) { Business.new(username: 'dugans_on_halsted', password:'dugans', sub_merchant_id:'braintreesecret', email:'dugans@dugans.com', doing_business_as:'Dugans') }
    it "is invalid without a username" do
      expect(business_no_username).to_not be_valid
    end
    it "is invalid without a sub_merchant_id" do
      expect(business_no_sub_merchant_id).to_not be_valid
    end
    it "is invalid without an email" do
      expect(business_no_email).to_not be_valid
    end
    it "is invalid without a doing_business_as" do
      expect(business_no_doing_business_as).to_not be_valid
    end
    it "is invalid without a password" do
      expect(business_no_password).to_not be_valid
    end
    it "is invalid with non unique information" do
      expect(business_not_unique).to_not be_valid
    end
  end
end

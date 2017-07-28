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
    it "a email" do
      expect(business.email).to eq 'dugans@dugans.com'
    end
    it "a password" do
      expect(business.authenticate('dugans')).to be_truthy
    end
  end
end

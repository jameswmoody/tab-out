require 'rails_helper'

describe UsersHelper do
  describe "#name" do
    it "returns the full name of a customer" do
      customer = Customer.new(first_name: 'Josh', last_name: 'Harvey')
      expect(name(customer)).to eq "Josh Harvey"
    end
    it "returns the doing business as name of a business" do
      business = Business.new(doing_business_as: 'Mullens')
      expect(name(business)).to eq "Mullens"
    end
  end
end

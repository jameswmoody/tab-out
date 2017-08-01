require 'rails_helper'

describe TabsHelper do
  describe "#price_in_dollars" do
    it "returns the price in human readable dollars" do
      expect(price_in_dollars(1000)).to eq "10.00"
    end
  end
end

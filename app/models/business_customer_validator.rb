class BusinessCustomerValidator < ActiveModel::Validator

  def validate(record)
    business_name = record.username
    customer = Customer.find_by(username: business_name)
    if customer
      record.errors[:base] << "Username already exists"
    end
  end
end

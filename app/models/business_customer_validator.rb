class BusinessCustomerValidator < ActiveModel::Validator

  def validate(record)
    business_name = record.username
    if business_name == Customer.find_by(username: business_name).username
      record.errors[:base] << "Username already exists"
    end
  end
end

class CustomerBusinessValidator < ActiveModel::Validator

  def validate(record)
    customer_name = record.username
    business = Business.find_by(username: customer_name)
    if business
      record.errors[:base] << "Username already exists"
    end
  end
end

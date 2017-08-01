class CustomerBusinessValidator < ActiveModel::Validator

  def validate(record)
    customer_name = record.username
    if customer_name == Business.find_by(username: customer_name).username
      record.errors[:base] << "Username already exists"
    end
  end
end

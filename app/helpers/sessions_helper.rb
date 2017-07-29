module SessionsHelper
  def login(user)
    session[:user_id] = user.id
  end

  def logged_in?
    !!session[:user_id]
  end

  def current_customer
    Customer.find(session[:user_id])
  end

  def current_business
    Business.find(session[:user_id])
  end

  def logout
    session.delete(:user_id)
    current_user = nil
  end
end

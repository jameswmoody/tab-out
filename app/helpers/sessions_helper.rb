module SessionsHelper
  def login(user)
    session[:user_id] = user.id
    if user.class == Customer
      session[:user_type] = 'Customer'
    else
      session[:user_type] = 'Business'
    end
  end

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    if session[:user_type] == 'Customer'
      Customer.find(session[:user_id])
    else
      Business.find(session[:user_id])
    end
  end

  def logout
    session.delete(:user_id)
    session.delete(:user_type)
    current_user = nil
  end
end

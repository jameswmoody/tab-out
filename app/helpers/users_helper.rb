module UsersHelper
  def name(user)
    if user.class == Business
      user.dba
    elsif user.class == Customer
      "#{user.first_name} #{user.last_name}"
    else
      "TapOut"
    end
  end

end

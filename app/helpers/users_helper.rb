module UsersHelper
  def name(user)
    if user.class == Business
      user.dba
    else
      "#{user.first_name} #{user.last_name}"
    end
  end

end

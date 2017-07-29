class PagesController < ApplicationController
  def index
    if !logged_in?
      redirect_to login_path
    else
      redirect_to current_user
    end
  end
end

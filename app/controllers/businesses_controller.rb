class BusinessesController < ApplicationController
  def show
    @business = Business.find(params[:id])
    redirect_to root_path and return if session[:user_id] != params[:id].to_i || session[:user_type] != "Business"
    if params[:search]
      @tabs = @business.search(params[:search])
    else
      @tabs = @business.open_tabs
    end
  end
end

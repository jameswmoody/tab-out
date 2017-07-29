class BusinessesController < ApplicationController
  def show
    @business = Business.find(params[:id])
    redirect_to root_path unless session[:user_id] == @business.id && session[:user_type] == "#{@business.class}"
    if params[:search]
      @tabs = @business.search(params[:search])
    else
      @tabs = @business.tabs
    end
  end
end

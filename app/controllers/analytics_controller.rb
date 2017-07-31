class AnalyticsController < ApplicationController
  def index
    @business = Business.find(current_user.id)
    @recent_sales = @business.tabs.where()
  end
end

class AnalyticsController < ApplicationController
  def index
    @business = Business.find(current_user.id)
    @sales = @business.tabs.group_by()
  end
end

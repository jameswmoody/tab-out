class TabsController < ApplicationController
  def new
    @tab = Tab.new
  end

  def create
    @business = Business.find_by(username: params[:username])
    if @business
      @tab = Tab.new(business_id: @business.id, customer_id: 1)
      if @tab.save
        redirect_to tab_path(@tab)
      else
        @errors = ['This is not a valid bar']
        render 'new'
      end
    else
      @errors = ['This is not a valid bar']
      render 'new'
    end
  end
end

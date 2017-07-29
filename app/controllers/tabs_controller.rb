class TabsController < ApplicationController
  def new
    @tab = Tab.new
  end

  def create
    p params
    @business = Business.find_by(username: params[:username])
    if @business
      @tab = Tab.new(business_id: @business.id, customer_id: current_user.id)
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

  def show
    @tab = Tab.find(params[:id])
    @item = Item.new
    render 'show'
  end

  def checkout
    @tab = Tab.find(params[:id])
    p "We made it to checkout"
    render 'checkout'
  end

  def close
  end

end

class TabsController < ApplicationController
  def new
    @tab = Tab.new
  end

  def create
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
    @client_token = CreditCardService.new(customer: @tab.customer).generate_token(vault_id: @tab.customer.vault_id)
    render 'checkout'
  end

  def close
    @tab = Tab.find(params[:id])
    sub_total = @tab.total_price
    tip_percentage = params[:close][:tip].to_i
    total = sub_total * tip_percentage / 100 + sub_total
    result = CreditCardService.new(customer: @tab.customer).create_transaction(total)
    redirect_to @tab.customer
  end

end

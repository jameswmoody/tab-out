class ItemsController < ApplicationController
  include TabsHelper

  def new
    redirect_to root_path
    @item = Item.new
  end

  def create
    price = convert_to_cents(item_params[:price])
    drink_type = item_params[:drink_type]
    @item = Item.new(price: price, drink_type: drink_type)
    @tab = Tab.find(params[:tab_id])

    if @tab.total_price >= @tab.limit_cost
      @already_past_limit = true
    else
      @already_past_limit = false
    end

    @item.tab = @tab

    if @item.save

      # send twilio text if you hit your limits
      if @item.tab.limit_amount == Tab.find(params[:tab_id]).items.length && @item.tab.limit_amount != 0
        pluralized_response = @item.tab.limit_amount.to_s + ' ' + 'drink'.pluralize(@item.tab.limit_amount)
        TextMessageService.new({text_number: @tab.customer.phone, text_body: "Friendly reminder from TabOut - you've reached your limit of #{pluralized_response}!"}).send_text
      end

      if Tab.find(params[:tab_id]).total_price >= @item.tab.limit_cost && !@already_past_limit && @item.tab.limit_cost != 0
        pluralized_response = price_in_dollars(@item.tab.limit_cost) + ' ' + 'dollars'.pluralize(@item.tab.limit_cost)
        TextMessageService.new({text_number: @tab.customer.phone, text_body: "Friendly reminder - you've reached your limit of $#{pluralized_response}!"}).send_text
      end

      redirect_to tab_path(@item.tab)
    else
      @errors = @item.errors.full_messages
      render 'new'
    end
  end

  def show
    @item = Item.find(params[:id])
    redirect_to tab_path(@item.tab)
  end

  def destroy
    @item = Item.find(params[:id])
    if @item
      @tab = @item.tab
      @item.destroy!
      redirect_to tab_path(@tab)
    else
      @errors = ["This item was deleted already - Please refresh your page to update the tab!"]
      @tab = Tab.find(params[:tab_id])
      @item = Item.new
      render '/tabs/show'
    end
  end

  private

  def convert_to_cents(price_in_dollars)
    price_in_dollars.to_f * 100
  end

  def item_params
    params.require(:item).permit(:drink_type, :price)
  end
end

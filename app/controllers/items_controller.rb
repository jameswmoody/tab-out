class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    price = convert_to_cents(item_params[:price])
    drink_type = item_params[:drink_type]

    @item = Item.new(price: price, drink_type: drink_type)
    @item.tab = Tab.find(params[:tab_id])
    p @item
    if @item.save
      redirect_to tab_path(@item.tab)
    else
      @errors = @item.errors.full_messages
      render 'new'
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
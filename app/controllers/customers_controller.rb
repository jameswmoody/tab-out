class CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
    @recent_tabs = @customer.tabs.order("updated_at DESC").limit(3)
    @open_tab = @customer.tabs.last
    @bar = @open_tab.business.dba
    p @bar
    p @recent_tabs

  end
end

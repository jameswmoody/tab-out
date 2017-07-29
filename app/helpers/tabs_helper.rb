module TabsHelper
  def price_in_dollars(cents)
    dollars = cents/100
    "$#{dollars.to_s}"
  end

  def tabs_view(tab)
    if @business
      "#{tab.customer.first_name}....#{price_in_dollars(tab.total_price)}"
    else
      "#{tab.business.dba}....#{price_in_dollars(tab.total_price)}"
    end
  end
end

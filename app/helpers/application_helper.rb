module ApplicationHelper
  def price_in_dollars(cents)
    dollars = cents/100
    "$#{dollars.to_s}"
  end
end

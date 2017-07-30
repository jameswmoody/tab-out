module TabsHelper
  def price_in_dollars(price)
    dollars = price/100
    cents = price%100
    if cents < 10
      cents = "0#{cents}"
    end
    "#{dollars}.#{cents}"
  end
end

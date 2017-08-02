module StatsHelper
  def total_sales
    sum = 0
    current_user.tabs.each do |tab|
      sum+=tab.total_price
    end
    sum
  end

  def daily_sales
    daily_tabs = current_user.tabs.where("created_at >= ?", Time.zone.now.beginning_of_day)

    sum = 0
    daily_tabs.each do |tab|
      sum+=tab.total_price
    end
    sum
  end

  def weekly_sales
    weekly_tabs = current_user.tabs.where("created_at >= ?", 1.week.ago.utc)

    sum = 0
    weekly_tabs.each do |tab|
      sum+=tab.total_price
    end
    sum
  end

  def monthly_sales
    monthly_tabs = current_user.tabs.where("created_at >= ?", 1.month.ago.utc)

    sum = 0
    monthly_tabs.each do |tab|
      sum+=tab.total_price
    end
    sum
  end

  def daily_count
    current_user.tabs.where("created_at >= ?", Time.zone.now.beginning_of_day).count
  end

  def weekly_count
    current_user.tabs.where("created_at >= ?", 1.week.ago.utc).count
  end

  def monthly_count
    current_user.tabs.where("created_at >= ?", 1.month.ago.utc).count
  end

  def monthly_unique_customers

  end

  def total_drinks
    drink_count = 0
    current_user.tabs.each do |tab|
      drink_count+=tab.items.count
    end
    drink_count
  end
end

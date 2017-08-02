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
    montly_tabs = current_user.tabs.where("created_at >= ?", 1.month.ago.utc)
    montly_tabs.pluck(:customer_id).uniq.count
  end

  def total_drinks
    drink_count = 0
    current_user.tabs.each do |tab|
      drink_count+=tab.items.count
    end
    drink_count
  end

  def drink_by_type
    drinks = {"Beer"=>0, "Wine"=>0, "Cocktail"=>0, "Shot/Liqour"=>0}

    current_user.tabs.each do |tab|
      tab.items.each do |item|
        if item.drink_type == 'Beer'
          drinks['Beer']+=1
        elsif item.drink_type == 'Wine'
          drinks['Wine']+=1
        elsif item.drink_type == 'Cocktail'
          drinks['Cocktail']+=1
        else
          drinks['Shot/Liqour']+=1
        end
      end
    end
    drinks
  end

  def monthly_drink_by_type
    drinks = {"Beer"=>0, "Wine"=>0, "Cocktail"=>0, "Shot/Liqour"=>0}
    montly_tabs = current_user.tabs.where("created_at >= ?", 1.month.ago.utc)

    montly_tabs.each do |tab|
      tab.items.each do |item|
        if item.drink_type == 'Beer'
          drinks['Beer']+=1
        elsif item.drink_type == 'Wine'
          drinks['Wine']+=1
        elsif item.drink_type == 'Cocktail'
          drinks['Cocktail']+=1
        else
          drinks['Shot/Liqour']+=1
        end
      end
    end
    drinks
  end

  def weekly_drink_by_type
    drinks = {"Beer"=>0, "Wine"=>0, "Cocktail"=>0, "Shot/Liqour"=>0}
    weekly_tabs = current_user.tabs.where("created_at >= ?", 1.week.ago.utc)

    weekly_tabs.each do |tab|
      tab.items.each do |item|
        if item.drink_type == 'Beer'
          drinks['Beer']+=1
        elsif item.drink_type == 'Wine'
          drinks['Wine']+=1
        elsif item.drink_type == 'Cocktail'
          drinks['Cocktail']+=1
        else
          drinks['Shot/Liqour']+=1
        end
      end
    end
    drinks
  end

  def daily_drink_by_type
    drinks = {"Beer"=>0, "Wine"=>0, "Cocktail"=>0, "Shot/Liqour"=>0}
    daily_tabs = current_user.tabs.where("created_at >= ?", Time.zone.now.beginning_of_day)

    daily_tabs.each do |tab|
      tab.items.each do |item|
        if item.drink_type == 'Beer'
          drinks['Beer']+=1
        elsif item.drink_type == 'Wine'
          drinks['Wine']+=1
        elsif item.drink_type == 'Cocktail'
          drinks['Cocktail']+=1
        else
          drinks['Shot/Liqour']+=1
        end
      end
    end
    drinks
  end

  def returning_customers
    current_user.tabs.group(:customer_id).having('COUNT(*) > 1').count
  end

  def monthly_returning_customers
    monthly_tabs = current_user.tabs.where("created_at >= ?", 1.month.ago.utc)
    monthly_tabs.group(:customer_id).having('COUNT(*) > 1').count
  end

  def weekly_returning_customers
    weekly_tabs = current_user.tabs.where("created_at >= ?", 1.week.ago.utc)
    weekly_tabs.group(:customer_id).having('COUNT(*) > 1').count
  end
end

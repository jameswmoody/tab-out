module StatsHelper

  #   //////////////////////////////////////
  #  //            GENERAL               //
  # //////////////////////////////////////

  def drinks_by_type_builder(tabs)
    drinks = {"Beer"=>0, "Wine"=>0, "Cocktail"=>0, "Shot/Liquor"=>0}
    tabs.each do |tab|
      tab.items.each do |item|
        if item.drink_type == 'Beer'
          drinks['Beer']+=1
        elsif item.drink_type == 'Wine'
          drinks['Wine']+=1
        elsif item.drink_type == 'Cocktail'
          drinks['Cocktail']+=1
        else
          drinks['Shot/Liquor']+=1
        end
      end
    end
    drinks
  end

  def total_sales(tabs)
    sum = 0
    tabs.each do |tab|
      sum+=tab.total_price
    end
    sum
  end

  def average(tabs)
    sum = 0
    tabs.each do |tab|
      sum+=tab.total_price
    end
    sum/tabs.count
  end

  def tips(tabs)
    tips = 0
    tabs.each do |tab|
      tips+=tab.tip
    end
    tips
  end

  def outstanding(tabs)
    sum = 0
    tabs.each do |tab|
      if tab.is_open?
        sum+=tab.total_price
      end
    end
    sum
  end

  def total_drinks(tabs)
    drink_count = 0
    tabs.each do |tab|
      drink_count+=tab.items.count
    end
    drink_count
  end

  def unique_customers(tabs)
    tabs.pluck(:customer_id).uniq.count
  end

  def returning_customers(tabs)
    tabs.group(:customer_id).having('COUNT(*) > 1').count.count
  end

  #   //////////////////////////////////////
  #  //            DAILY                 //
  # //////////////////////////////////////

  def daily_tabs
    current_user.tabs.where("created_at >= ?", 1.day.ago.utc)
  end

  def daily_drink_by_type
    shift_one_tabs = current_user.tabs.where(created_at: 12.hours.ago.utc..9.hours.ago.utc)
    shift_two_tabs = current_user.tabs.where(created_at: 9.hours.ago.utc..6.hours.ago.utc)
    shift_three_tabs = current_user.tabs.where(created_at: 6.hours.ago.utc..3.hours.ago.utc)
    shift_four_tabs = current_user.tabs.where(created_at: 3.hours.ago.utc..Time.now)

    shift_one_drinks = drinks_by_type_builder(shift_one_tabs)
    shift_two_drinks = drinks_by_type_builder(shift_two_tabs)
    shift_three_drinks = drinks_by_type_builder(shift_three_tabs)
    shift_four_drinks = drinks_by_type_builder(shift_four_tabs)

    drinks = {
      'First Shift' => shift_one_drinks,
      'Second Shift' => shift_two_drinks,
      'Third Shift' => shift_three_drinks,
      'Fourth Shift' => shift_four_drinks
    }
  end

  #   //////////////////////////////////////
  #  //            WEEKLY                //
  # //////////////////////////////////////

  def weekly_tabs
    current_user.tabs.where("created_at >= ?", 1.week.ago.utc)
  end

  def weekly_drink_by_type
    day_one_tabs = current_user.tabs.where(created_at: 1.day.ago.utc..Time.now)
    day_two_tabs = current_user.tabs.where(created_at: 2.days.ago.utc..1.day.ago.utc)
    day_three_tabs = current_user.tabs.where(created_at: 3.days.ago.utc..2.days.ago.utc)
    day_four_tabs = current_user.tabs.where(created_at: 4.days.ago.utc..3.days.ago.utc)
    day_five_tabs = current_user.tabs.where(created_at: 5.days.ago.utc..4.days.ago.utc)
    day_six_tabs = current_user.tabs.where(created_at: 6.days.ago.utc..5.days.ago.utc)
    day_seven_tabs = current_user.tabs.where(created_at: 7.days.ago.utc..6.days.ago.utc)

    day_one_drinks = drinks_by_type_builder(day_one_tabs)
    day_two_drinks = drinks_by_type_builder(day_two_tabs)
    day_three_drinks = drinks_by_type_builder(day_three_tabs)
    day_four_drinks = drinks_by_type_builder(day_four_tabs)
    day_five_drinks = drinks_by_type_builder(day_five_tabs)
    day_six_drinks = drinks_by_type_builder(day_six_tabs)
    day_seven_drinks = drinks_by_type_builder(day_seven_tabs)

    drinks = {
      'Monday' => day_one_drinks,
      'Tuesday' => day_two_drinks,
      'Wednesday' => day_three_drinks,
      'Thursday' => day_four_drinks,
      'Friday' => day_five_drinks,
      'Saturday' => day_six_drinks,
      'Sunday' => day_seven_drinks,
    }
  end

  #   //////////////////////////////////////
  #  //            MONTHLY               //
  # //////////////////////////////////////

  def monthly_tabs
    current_user.tabs.where("created_at >= ?", 1.month.ago.utc)
  end

  def monthly_drink_by_type
    week_one_tabs = current_user.tabs.where(created_at: 1.week.ago.utc..Date.today)
    week_two_tabs = current_user.tabs.where(created_at: 2.week.ago.utc..1.week.ago.utc)
    week_three_tabs = current_user.tabs.where(created_at: 3.week.ago.utc..2.week.ago.utc)
    week_four_tabs = current_user.tabs.where(created_at: 4.week.ago.utc..3.week.ago.utc)

    week_one_drinks = drinks_by_type_builder(week_one_tabs)
    week_two_drinks = drinks_by_type_builder(week_two_tabs)
    week_three_drinks = drinks_by_type_builder(week_three_tabs)
    week_four_drinks = drinks_by_type_builder(week_four_tabs)

    drinks = {
      'W1' => week_one_drinks,
      'W2' => week_two_drinks,
      'W3' => week_three_drinks,
      'W4' => week_four_drinks
    }
  end
end

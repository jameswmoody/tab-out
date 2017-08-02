class DashboardController < ApplicationController

  def index
    @total_sales = total_sales
    @daily_sales = daily_sales
    @weekly_sales = weekly_sales
    @monthly_sales = monthly_sales
    @monthly_drink_by_type = monthly_drink_by_type

    @chart = Fusioncharts::Chart.new({
      width: "800",
      height: "400",
      type: "stackedcolumn2d",
      renderAt: "chartContainer",
      dataSource: {
        chart: {
          xAxisname: "Week",
          yAxisName: "Amount ($)",
          numberPrefix: "$",
          theme: "ocean",
          exportEnabled: "1",
          bgColor: "#F5F5F5"
        },
        categories: [{
          category: [
            { label: "W1" },
            { label: "W2" },
            { label: "W3" },
            { label: "W4" }
          ]
        }],
        dataset: [
          {
            seriesname: "Beer",
            color: "#00698c",
            data: [
              { value: @monthly_drink_by_type['W1']['Beer'] },
              { value: @monthly_drink_by_type['W2']['Beer'] },
              { value: @monthly_drink_by_type['W3']['Beer'] },
              { value: @monthly_drink_by_type['W4']['Beer'] }
            ]
          },
          {
            seriesname: "Cocktail",
            color: "#00BFFF",
            data: [
              { value: @monthly_drink_by_type['W1']['Cocktail'] },
              { value: @monthly_drink_by_type['W2']['Cocktail'] },
              { value: @monthly_drink_by_type['W3']['Cocktail'] },
              { value: @monthly_drink_by_type['W4']['Cocktail'] }
            ]
          },
          {
            seriesname: "Wine",
            color: "#6bdaff",
            data: [
              { value: @monthly_drink_by_type['W1']['Wine'] },
              { value: @monthly_drink_by_type['W2']['Wine'] },
              { value: @monthly_drink_by_type['W3']['Wine'] },
              { value: @monthly_drink_by_type['W4']['Wine'] }
            ]
          },
          {
            seriesname: "Shot/Liquor",
            color: "#adeaff",
            data: [
              { value: @monthly_drink_by_type['W1']['Shot/Liquor'] },
              { value: @monthly_drink_by_type['W2']['Shot/Liquor'] },
              { value: @monthly_drink_by_type['W3']['Shot/Liquor'] },
              { value: @monthly_drink_by_type['W4']['Shot/Liquor'] }
            ]
          }
        ]
      }
    })
  end

end

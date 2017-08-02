class DashboardController < ApplicationController

  def index
    @total_sales = total_sales
    @daily_sales = daily_sales
    @weekly_sales = weekly_sales
    @monthly_sales = monthly_sales

    @chart = Fusioncharts::Chart.new({
      width: "600",
      height: "400",
      type: "stackedcolumn2d",
      renderAt: "chartContainer",
      dataSource: {
        chart: {
          caption: current_user.dba,
          xAxisname: "Month",
          yAxisName: "Amount ($)",
          numberPrefix: "$",
          theme: "ocean",
          exportEnabled: "1",
        },
        categories: [{
          category: [
            { label: "July" },
            { label: "June" },
            { label: "May" },
            { label: "April" }
          ]
        }],
        dataset: [
          {
            seriesname: "Beer",
            data: [
              { value: "10000" },
              { value: "11500" },
              { value: "12500" },
              { value: "15000" }
            ]
          },
          {
            seriesname: "Cocktail",
            data: [
              { value: "10000" },
              { value: "11500" },
              { value: "12500" },
              { value: "15000" }
            ]
          },
          {
            seriesname: "Wine",
            data: [
              { value: "10000" },
              { value: "11500" },
              { value: "12500" },
              { value: "15000" }
            ]
          },
          {
            seriesname: "Shot/Liquor",
            data: [
              { value: "25400" },
              { value: "29800" },
              { value: "21800" },
              { value: "26800" }
            ]
          }
        ]
      }
    })
  end

end

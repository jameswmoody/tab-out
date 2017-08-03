class DashboardController < ApplicationController

  def index
    @daily_tabs = daily_tabs
    @weekly_tabs = weekly_tabs
    @monthly_tabs = monthly_tabs

    @daily_drink_by_type = daily_drink_by_type
    @weekly_drink_by_type = weekly_drink_by_type
    @monthly_drink_by_type = monthly_drink_by_type

    @today_chart = Fusioncharts::Chart.new({
      width: "100%",
      height: "145%",
      type: "stackedcolumn2d",
      renderAt: "today-chart",
      dataSource: {
        chart: {
          xAxisname: "Shift",
          yAxisName: "Amount ($)",
          numberPrefix: "$",
          theme: "ocean",
          exportEnabled: "1",
          bgColor: "#ffffff"
        },
        categories: [{
          category: [
            { label: "First Shift" },
            { label: "Second Shift" },
            { label: "Third Shift" },
            { label: "Fouth Shift" }
          ]
        }],
        dataset: [
          {
            seriesname: "Beer",
            color: "#00698c",
            data: [
              { value: @daily_drink_by_type['First Shift']['Beer'] },
              { value: @daily_drink_by_type['Second Shift']['Beer'] },
              { value: @daily_drink_by_type['Third Shift']['Beer'] },
              { value: @daily_drink_by_type['Fourth Shift']['Beer'] }
            ]
          },
          {
            seriesname: "Cocktail",
            color: "#00BFFF",
            data: [
              { value: @daily_drink_by_type['First Shift']['Cocktail'] },
              { value: @daily_drink_by_type['Second Shift']['Cocktail'] },
              { value: @daily_drink_by_type['Third Shift']['Cocktail'] },
              { value: @daily_drink_by_type['Fourth Shift']['Cocktail'] }
            ]
          },
          {
            seriesname: "Wine",
            color: "#6bdaff",
            data: [
              { value: @daily_drink_by_type['First Shift']['Wine'] },
              { value: @daily_drink_by_type['Second Shift']['Wine'] },
              { value: @daily_drink_by_type['Third Shift']['Wine'] },
              { value: @daily_drink_by_type['Fourth Shift']['Wine'] }
            ]
          },
          {
            seriesname: "Shot/Liquor",
            color: "#adeaff",
            data: [
              { value: @daily_drink_by_type['First Shift']['Shot/Liquor'] },
              { value: @daily_drink_by_type['Second Shift']['Shot/Liquor'] },
              { value: @daily_drink_by_type['Third Shift']['Shot/Liquor'] },
              { value: @daily_drink_by_type['Fourth Shift']['Shot/Liquor'] }
            ]
          }
        ]
      }
    })

    @week_chart = Fusioncharts::Chart.new({
      width: "100%",
      height: "145%",
      type: "stackedcolumn2d",
      renderAt: "week-chart",
      dataSource: {
        chart: {
          xAxisname: "Shift",
          yAxisName: "Amount ($)",
          numberPrefix: "$",
          theme: "ocean",
          exportEnabled: "1",
          bgColor: "#ffffff"
        },
        categories: [{
          category: [
            { label: "Monday" },
            { label: "Tuesday" },
            { label: "Wednesday" },
            { label: "Thursday" },
            { label: "Friday" },
            { label: "Saturday" },
            { label: "Sunday" }
          ]
        }],
        dataset: [
          {
            seriesname: "Beer",
            color: "#00698c",
            data: [
              { value: @weekly_drink_by_type['Monday']['Beer'] },
              { value: @weekly_drink_by_type['Tuesday']['Beer'] },
              { value: @weekly_drink_by_type['Wednesday']['Beer'] },
              { value: @weekly_drink_by_type['Thursday']['Beer'] },
              { value: @weekly_drink_by_type['Friday']['Beer'] },
              { value: @weekly_drink_by_type['Saturday']['Beer'] },
              { value: @weekly_drink_by_type['Sunday']['Beer'] }
            ]
          },
          {
            seriesname: "Cocktail",
            color: "#00BFFF",
            data: [
              { value: @weekly_drink_by_type['Monday']['Cocktail'] },
              { value: @weekly_drink_by_type['Tuesday']['Cocktail'] },
              { value: @weekly_drink_by_type['Wednesday']['Cocktail'] },
              { value: @weekly_drink_by_type['Thursday']['Cocktail'] },
              { value: @weekly_drink_by_type['Friday']['Cocktail'] },
              { value: @weekly_drink_by_type['Saturday']['Cocktail'] },
              { value: @weekly_drink_by_type['Sunday']['Cocktail'] }
            ]
          },
          {
            seriesname: "Wine",
            color: "#6bdaff",
            data: [
              { value: @weekly_drink_by_type['Monday']['Wine'] },
              { value: @weekly_drink_by_type['Tuesday']['Wine'] },
              { value: @weekly_drink_by_type['Wednesday']['Wine'] },
              { value: @weekly_drink_by_type['Thursday']['Wine'] },
              { value: @weekly_drink_by_type['Friday']['Wine'] },
              { value: @weekly_drink_by_type['Saturday']['Wine'] },
              { value: @weekly_drink_by_type['Sunday']['Wine'] }
            ]
          },
          {
            seriesname: "Shot/Liquor",
            color: "#adeaff",
            data: [
              { value: @weekly_drink_by_type['Monday']['Shot/Liquor'] },
              { value: @weekly_drink_by_type['Tuesday']['Shot/Liquor'] },
              { value: @weekly_drink_by_type['Wednesday']['Shot/Liquor'] },
              { value: @weekly_drink_by_type['Thursday']['Shot/Liquor'] },
              { value: @weekly_drink_by_type['Friday']['Shot/Liquor'] },
              { value: @weekly_drink_by_type['Saturday']['Shot/Liquor'] },
              { value: @weekly_drink_by_type['Sunday']['Shot/Liquor'] }
            ]
          }
        ]
      }
    })

    @month_chart = Fusioncharts::Chart.new({
      width: "100%",
      height: "145%",
      type: "stackedcolumn2d",
      renderAt: "month-chart",
      dataSource: {
        chart: {
          xAxisname: "Shift",
          yAxisName: "Amount ($)",
          numberPrefix: "$",
          theme: "ocean",
          exportEnabled: "1",
          bgColor: "#ffffff"
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

    @all_chart = Fusioncharts::Chart.new({
      width: "100%",
      height: "145%",
      type: "stackedcolumn2d",
      renderAt: "all-chart",
      dataSource: {
        chart: {
          xAxisname: "Shift",
          yAxisName: "Amount ($)",
          numberPrefix: "$",
          theme: "ocean",
          exportEnabled: "1",
          bgColor: "#ebebeb"
        },
        categories: [{
          category: [
            { label: "2015" },
            { label: "2016" },
            { label: "W017" }
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

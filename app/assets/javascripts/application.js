// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require jquery_ujs
//= require_tree .

$( document ).ready(function() {
  var subtotalStr = $('#total-price-checkout').text().substring(1);
  var subtotalInt = parseInt(subtotalStr)
  $("input[name='close[tip]']").click(function() {
      var tipPercentageStr = this.value;
      var tipPercentageInt = parseInt(tipPercentageStr);
      var tipAmountInt = subtotalInt * tipPercentageInt / 100;
      var totalInt = subtotalInt + tipAmountInt

      $('#total-price-checkout').text('$'+ totalInt);
  });

// When app is bookmarked, prevents links from opening new browser on mobile
  var a=document.getElementsByTagName("a");
  for(var i=0;i<a.length;i++) {
    a[i].onclick=function() {
        window.location=this.getAttribute("href");
        return false
    }
  }
});

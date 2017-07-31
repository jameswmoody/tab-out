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
  var id, options;
    $('.nav-open').click(function() {
      document.getElementById("navbar").style.width = "250px";
    })

    $('.nav-close').click(function() {
      document.getElementById("navbar").style.width = "0";
    })


  var subtotalStr = $('#total-price-checkout').text().substring(1);
  var subtotalInt = parseInt(subtotalStr)
  $("label.label-click").click(function() {
      console.log(this);
      var tipPercentageStr = $(this).text();
      var tipPercentageInt = parseInt(tipPercentageStr);
      var tipAmountInt = subtotalInt * tipPercentageInt / 100;
      var totalInt = subtotalInt + tipAmountInt

    $('#total-price-checkout').text('$'+ totalInt);

  });

  // Floating Geo Stuff
  $('#open-tab').on('click', function() {
    navigator.geolocation.getCurrentPosition(storePosition)
    id = navigator.geolocation.watchPosition(success, error, options);
  })

// When app is bookmarked, prevents links from opening new browser on mobile
  var a=document.getElementsByTagName("a");
  for(var i=0;i<a.length;i++) {
    a[i].onclick=function() {
        window.location=this.getAttribute("href");
        return false
    }
  }
});

function storePosition(position) {
    target = {
      latitude : position.coords.latitude,
      longitude: position.coords.longitude
    };
    console.log(target)
}

function success(pos) {
  var crd = pos.coords;
  // crd.latitude = crd.latitude.toFixed(4);
  // crd.longitude = crd.longitude.toFixed(4);

  if (target.latitude.toFixed(3) == crd.latitude.toFixed(3) && target.longitude.toFixed(3) == crd.longitude.toFixed(3)) {
      alert('you arrived')
    $.post('/twilio')

    navigator.geolocation.clearWatch(id);
  }
}

function error(err) {
  console.warn('ERROR(' + err.code + '): ' + err.message);
  alert('didnt work');
}


options = {
  enableHighAccuracy: true,
  timeout: 50000,
  maximumAge: 0
};

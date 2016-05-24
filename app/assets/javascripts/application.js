// // This is a manifest file that'll be compiled into application.js, which will include all the files
// // listed below.
// //
// // Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// // or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
// //
// // It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// // compiled file.
// //
// // Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// // about supported directives.
// //
// //= require jquery
// //= require jquery_ujs
// //= require twitter/bootstrap
// //= require turbolinks
// //= require_tree .


  function writeAddressName(latLng) {
    var geocoder = new google.maps.Geocoder();
    geocoder.geocode({
      "location": latLng
    },
    function(results, status) {
      if (status == google.maps.GeocoderStatus.OK){
        // console.log(latLng.lat());
        // console.log(latLng.lng());
        $('input#latitude').val(latLng.lat());
        $('input#longitude').val(latLng.lng());
      }else{
        document.getElementById("error").innerHTML += "Unable to retrieve your address" + "<br />";
      }
    });
  }

  function geolocationSuccess(position) {
    var userLatLng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
    // Write the formatted address
    $('input[type=submit]').prop('disabled', false);

    writeAddressName(userLatLng);

    var myOptions = {
      zoom : 16,
      center : userLatLng,
      mapTypeId : google.maps.MapTypeId.ROADMAP
    };
    // Draw the map
    var mapObject = new google.maps.Map(document.getElementById("map"), myOptions);
    // Place the marker
    new google.maps.Marker({
      map: mapObject,
      position: userLatLng
    });
    // Draw a circle around the user position to have an idea of the current localization accuracy
    var circle = new google.maps.Circle({
      center: userLatLng,
      radius: position.coords.accuracy,
      map: mapObject,
      fillColor: '#0000FF',
      fillOpacity: 0.5,
      strokeColor: '#0000FF',
      strokeOpacity: 1.0
    });
    mapObject.fitBounds(circle.getBounds());
  }

  function geolocationError(positionError) {
    document.getElementById("error").innerHTML += "Error: " + positionError.message + "<br />";
  }

  function geolocateUser() {
    // If the browser supports the Geolocation API
    if (navigator.geolocation)
    {
      var positionOptions = {
        enableHighAccuracy: true,
        timeout: 10 * 1000 // 10 seconds
      };
      navigator.geolocation.getCurrentPosition(geolocationSuccess, geolocationError, positionOptions);
    }
    else
      document.getElementById("error").innerHTML += "Your browser doesn't support the Geolocation API";
  }

  window.onload = geolocateUser;

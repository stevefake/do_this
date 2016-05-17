// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .


// navbar:
// $(document).ready(function(){
//   $('nav navbar-nav').hover(
//     function(){
//     $(this).addClass('active');
//     },
//     function(){
//     $(this).removeClass('active');
//     }
//   );
// });

// geolocation:
src="http://maps.google.com/maps/api/js?sensor=true"

function writeAddressName(latLng) {
  var geocoder = new google.maps.Geocoder();
  geocoder.geocode({
    "location": latLng
  },
  function(results, status) {
    if (status == google.maps.GeocoderStatus.OK)
      document.getElementById("address").innerHTML = results[0].formatted_address;
    else
      document.getElementById("error").innerHTML += "Unable to retrieve your address" + "<br />";
  });
}

function geolocationSuccess(position) {
  var userLatLng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
  // Write the formatted address
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



var markersArray = [];
var SCHOOL_LAT = 38.9059372;
var SCHOOL_LNG = -77.0442446;
var QUERY_DELAY = 400;
var inactive = false;

$(document).ready(function() {
  // initialize the map on load
  initialize();
});

// check for Geolocation support https://developers.google.com/web/fundamentals/native-hardware/user-location/obtain-location
if (navigator.geolocation) {
  console.log('Geolocation is supported!');
}
else {
  console.log('Geolocation is not supported for this Browser/OS version yet.');
}

// Determine the User’s Current Location
window.onload = function() {
  var startPos;
  var geoSuccess = function(position) {
    startPos = position;
    // document.getElementById('startLat').innerHTML = startPos.coords.latitude;
    // document.getElementById('startLon').innerHTML = startPos.coords.longitude;
  };


  var geoError = function(error) {
    console.log('Error occurred. Error code: ' + error.code);
    // error.code can be:
    //   0: unknown error
    //   1: permission denied
    //   2: position unavailable (error response from location provider)
    //   3: timed out
  };
  navigator.geolocation.getCurrentPosition(geoSuccess);
};

var geolocation = function(map) {
  // var searchTerm = $('#map_search input[type=text]').val();
  var searchTerm = $('#map_search tacos').val();


  if (inactive === true) { return };

  // post to the search with the search term, take the response data
  // and process it
  $.post('/search', { term: searchTerm }, function(data) {
    inactive = true;

    // do some clean up
    $('#results').show();
    $('#results').empty();
    clearMarkers();

    // iterate through each business in the response capture the data
    // within a closure.
    data['businesses'].forEach(function(business, index) {
      capture(index, map, business);
    });
  });
};

// post to the food with the food term, take the response data
// and process it
$.post('/food', { term: foodTerm }, function(data) {
  inactive = true;

  // do some clean up
  $('#results').show();
  $('#results').empty();
  clearMarkers();

  // iterate through each business in the response capture the data
  // within a closure.
  data['businesses'].forEach(function(business, index) {
    capture(index, map, business);
  });
});
};





/**
 * Initializes the map and some events on page load
 */
var initialize = function() {
  var mapOptions = {
    center: new google.maps.LatLng(SCHOOL_LAT, SCHOOL_LNG),
    zoom: 18,

    // hide controls
    panControl: false,
    streetViewControl: false,

    // reconfigure the zoom controls
    zoomControl: true,
    zoomControlOptions: {
      position: google.maps.ControlPosition.RIGHT_BOTTOM,
      style: google.maps.ZoomControlStyle.SMALL
    }
  };

  // create a new Google map with the options in the map element
  var map = new google.maps.Map($('#map_canvas')[0], mapOptions);

  bind_controls(map);
}
/**
 * Bind and setup search control for the map
 *
 * param: map - the Google map object
 */
var bind_controls = function(map) {
  // get the container for the search control and bind and event to it on submit
  var controlContainer = $('#control_container')[0];
  google.maps.event.addDomListener(controlContainer, 'submit', function(e) {
    e.preventDefault();
    search(map);
  });

  // get the search button and bind a click event to it for searching
  var searchButton = $('#map_search_submit')[0];
  google.maps.event.addDomListener(searchButton, 'click', function(e) {
    e.preventDefault();
    search(map);
  });

  // push the search controls onto the map
  // map.controls[google.maps.ControlPosition.TOP_LEFT].push(controlContainer);
}

/**
 * Makes a post request to the server with the search term and
 * populates the map with the response businesses
 *
 * param: map - the Google map object
 */
var search = function(map) {
  var searchTerm = $('#map_search input[type=text').val();

  if (inactive === true) { return };

  // post to the search with the search term, take the response data
  // and process it
  $.post('/search', { term: searchTerm }, function(data) {
    inactive = true;

    // do some clean up
    $('#results').show();
    $('#results').empty();
    clearMarkers();

    // iterate through each business in the response capture the data
    // within a closure.
    data['businesses'].forEach(function(business, index) {
      capture(index, map, business);
    });
  });
};

/**
 * Capture the specific business objects within a closure for setTimeout
 * or else it'll execute only on the last business in the array
 *
 * param: i - the index the business was at in the array, used to the
 *            timeout delay
 * param: map - the Google map object used for geocoding and marker placement
 * param: business - the business object from the response
 */
var capture = function(i, map, business) {
  setTimeout(function() {
    if (i === 15) {
      inactive = false;
    }

    $('#results').append(build_results_container(business));

    // get the geocoded address for the business's location
    geocode_address(map, business['name'], business['location']);
  }, QUERY_DELAY * i); // the delay on the timeout
};

/**
 * Builds the div that'll display the business result from the API
 *
 * param: business - object of the business response
 */
var build_results_container = function(business) {
  return [
    '<div class="result">',
      '<img class="biz_img" src="', business['image_url'], '">',
      '<h5><a href="', business['url'] ,'" target="_blank">', business['name'], '</a></h5>',
      '<img src="', business['rating_img_url'], '">',
      '<p>', business['review_count'], ' reviews</p>',
      '<p class="clear-fix"></p>',
    '</div>'
  ].join('');
};

/**
 * Geocode the address from the business and drop a marker on it's
 * location on the map
 *
 * param: map - the Google map object to drop a marker on
 * param: name - the name of the business, used for when you hover
 *               over the dropped marker
 * param: location_object - an object of the businesses address
 */
var geocode_address = function(map, name, location_object) {
  var geocoder = new google.maps.Geocoder();

  var address = [
    location_object['address'][0],
    location_object['city'],
    location_object['country_code']
  ].join(', ');

  // geocode the address and get the lat/lng
  geocoder.geocode({address: address}, function(results, status) {
    if (status === google.maps.GeocoderStatus.OK) {

      // create a marker and drop it on the name on the geocoded location
      var marker = new google.maps.Marker({
        animation: google.maps.Animation.DROP,
        map: map,
        position: results[0].geometry.location,
        title: name
      });

      // save the marker object so we can delete it later
      markersArray.push(marker);
    } else {
      console.log("Geocode was not successful for the following reason: " + status);
    }
  });
};

/**
 * Remove all of the markers from the map by setting them
 * to null
 */
var clearMarkers = function() {
  markersArray.forEach(function(marker) {
    marker.setMap(null);
  });

  markersArray = [];
};



// var initialLocation;
// var siberia = new google.maps.LatLng(60, 105);
// var newyork = new google.maps.LatLng(40.69847032728747, -73.9514422416687);
// var browserSupportFlag =  new Boolean();

function initialize() {
  var myOptions = {
    zoom: 6,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  var map = new google.maps.Map(document.getElementById("map"), myOptions);

  // Try W3C Geolocation (Preferred)
  if(navigator.geolocation) {
    browserSupportFlag = true;
    navigator.geolocation.getCurrentPosition(function(position) {
      initialLocation = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
      map.setCenter(initialLocation);
    }, function() {
      handleNoGeolocation(browserSupportFlag);
    });
  }
  // Browser doesn't support Geolocation
  else {
    browserSupportFlag = false;
    handleNoGeolocation(browserSupportFlag);
  }

  function handleNoGeolocation(errorFlag) {
    if (errorFlag == true) {
      alert("Geolocation service failed.");
      initialLocation = newyork;
    } else {
      alert("Your browser doesn't support geolocation. We've placed you in Siberia.");
      initialLocation = siberia;
    }
    map.setCenter(initialLocation);
  }
}

// var userLatLng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);

// var myOptions = {
//   zoom : 16,
//   center : userLatLng,
//   mapTypeId : google.maps.MapTypeId.ROADMAP
// }
// var mapObject = new google.maps.Map(document.getElementById("map"), myOptions);
//
// new google.maps.Marker({map: mapObject, position: userLatLng });
//
// var circle = new google.maps.Circle({
//   center: userLatLng,
//   radius: position.coords.accuracy,
//   map: mapObject,
//   fillColor: '#0000FF',
//   fillOpacity: 0.5,
//   strokeColor: '#0000FF',
//   strokeOpacity: 1.0
// });
// mapObject.fitBounds(circle.getBounds());
//
// function writeAddressName(latLng) {
//   var geocoder = new google.maps.Geocoder();
//   geocoder.geocode({
//     "location": latLng
//   },
//   function(results, status) {
//     if (status == google.maps.GeocoderStatus.OK)
//       document.getElementById("address").innerHTML = results[0].formatted_address;
//     else
//       document.getElementById("error").innerHTML += "Unable to retrieve your address"  + "<br />";
//   });
// }


// WALKING DIRECTIONS PLAYGROUND
// var directionsDisplay;
// var directionsService = new google.maps.DirectionsService();
// var map;
//
// function initialize() {
//   directionsDisplay = new google.maps.DirectionsRenderer();
//   var chicago = new google.maps.LatLng(41.850033, -87.6500523);
//   var mapOptions = {
//     zoom:7,
//     center: chicago
//   }
//   map = new google.maps.Map(document.getElementById("map"), mapOptions);
//   directionsDisplay.setMap(map);
//   directionsDisplay.setPanel(document.getElementById("directionsPanel"));
// }
//
// function calcRoute() {
//   var start = document.getElementById("start").value;
//   var end = document.getElementById("end").value;
//   var request = {
//     origin:start,
//     destination:end,
//     travelMode: google.maps.TravelMode.DRIVING
//   };
//   directionsService.route(request, function(response, status) {
//     if (status == google.maps.DirectionsStatus.OK) {
//       directionsDisplay.setDirections(response);
//     }
//   });
// }

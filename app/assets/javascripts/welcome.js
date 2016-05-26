
function writeAddressName(latLng) {
    var geocoder = new google.maps.Geocoder();

    geocoder.geocode({
            "location": latLng
        },
        function(results, status) {
            // console.log(results, status);
            if (status == google.maps.GeocoderStatus.OK) {
                $('input.latitude').val(latLng.lat());
                $('input.longitude').val(latLng.lng());
            } else if (document.getElementById("error")){
                document.getElementById("error").innerHTML += "Unable to retrieve your address" + "<br />";
            } else {
              alert("Unable to retrieve your address");
            }
        });
}

function geolocationSuccess(position) {
    console.log("geolocation success", position);
    var userLatLng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
    // Write the formatted address
    $('.pending-geolocation').hide();
    $('input[type=submit]').prop('style', false);
    writeAddressName(userLatLng);
}

function geolocationError(positionError) {
    console.log("position error, geolocate fail", positionError);
    if (document.getElementById("error")){
    document.getElementById("error").innerHTML += "Error: " + positionError.message + "<br />";
  }
}

function geolocateUser() {
    // If the browser supports the Geolocation API
    if (navigator.geolocation) {
        var positionOptions = {
            enableHighAccuracy: true,
            timeout: 10 * 1000 // 10 seconds
        };
        navigator.geolocation.getCurrentPosition(geolocationSuccess, geolocationError, positionOptions);
    } else
        document.getElementById("error").innerHTML += "Your browser doesn't support the Geolocation API";
}

window.onload = geolocateUser;


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
            } else {
                document.getElementById("error").innerHTML += "Unable to retrieve your address" + "<br />";
            }
        });
}

function geolocationSuccess(position) {
    var userLatLng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
    // Write the formatted address
    $('.pending-geolocation').hide();
    $('input[type=submit]').prop('style', false);
    writeAddressName(userLatLng);
}

function geolocationError(positionError) {
    document.getElementById("error").innerHTML += "Error: " + positionError.message + "<br />";
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

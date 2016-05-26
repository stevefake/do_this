if (navigator.geolocation) { //Checks if browser supports geolocation
 navigator.geolocation.getCurrentPosition(function (position) {                                                              //This gets the
   var latitude = position.coords.latitude;                    //users current
   var longitude = position.coords.longitude;                 //location
   var coords = new google.maps.LatLng(latitude, longitude); //Creates variable for map coordinates
   var directionsService = new google.maps.DirectionsService();
   var directionsDisplay = new google.maps.DirectionsRenderer();
   var mapOptions = //Sets map options
   {
     zoom: 15,  //Sets zoom level (0-21)
     center: coords, //zoom in on users location
     mapTypeControl: true, //allows you to select map type eg. map or satellite
     navigationControlOptions:
     {
       style: google.maps.NavigationControlStyle.SMALL //sets map controls size eg. zoom
     },
     mapTypeId: google.maps.MapTypeId.ROADMAP //sets type of map Options:ROADMAP, SATELLITE, HYBRID, TERRIAN
   };
   map = new google.maps.Map( /*creates Map variable*/ document.getElementById("map"), mapOptions /*Creates a new map using the passed optional parameters in the mapOptions parameter.*/);
   directionsDisplay.setMap(map);
   directionsDisplay.setPanel(document.getElementById('panel'));
   var request = {
     origin: coords,
     destination: destinationLatLng,
     travelMode: google.maps.DirectionsTravelMode.WALKING
   };

   directionsService.route(request, function (response, status) {
     if (status == google.maps.DirectionsStatus.OK) {
       directionsDisplay.setDirections(response);
     }
   });
 });
}

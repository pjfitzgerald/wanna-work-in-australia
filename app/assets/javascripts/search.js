function initMap(lat, lng) {
  var myCoords = new google.maps.LatLng(lat, lng);    // map initialisation location

  var mapOptions = {
    center: myCoords,
    zoom: 14
  };

  var map = new google.maps.Map(document.getElementById('map'), mapOptions);
  
  var marker = new google.maps.Marker({
    position: (myCoords),
    map: map,
    animation: google.maps.Animation.DROP
  });


  // geocoding to address on-click

  var geocoder = new google.maps.Geocoder();

  google.maps.event.addListener(map, 'click', function (event) {
    geocoder.geocode({
      'latLng': event.latLng
    }, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        if (results[0]) {
          alert(results[0].formatted_address);
        }
      }
    })
    }
  );

};

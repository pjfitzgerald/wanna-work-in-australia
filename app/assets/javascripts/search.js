
// initiating map on page
function initMap(lat, lng, initialZoom, venues) {
  const myCoords = new google.maps.LatLng(lat, lng);    // map initialisation location

  const mapOptions = {
    center: myCoords,
    zoom: initialZoom
  };

  // setting map to variable for reference
  const map = new google.maps.Map(document.getElementById('map'), mapOptions);

  // geocoding to address on-click
  const geocoder = new google.maps.Geocoder();
  google.maps.event.addListener(map, 'click', (event) => {
    geocoder.geocode({
      'latLng': event.latLng
    }, function (results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        if (results[0]) {
          // add result to info-address-card inside info-container
          document.querySelector('.info-address-card').innerHTML = `<h4><strong>Address:</strong> <br> ${results[0].formatted_address}</h4>`;
        }
      }
    })
  });
  
  // function to place markers on map for each venue in Venue.all
  function addMarkers(venues) {
    venues.forEach((venue) => {
      let venueCoords = new google.maps.LatLng(venue.latitude, venue.longitude);
      let marker = new google.maps.Marker({
        position: (venueCoords),
        map: map,
        animation: google.maps.Animation.DROP
      });
    })
  }

  addMarkers(gon.venues);

};


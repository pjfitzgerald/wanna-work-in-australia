
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
        animation: google.maps.Animation.DROP,
        title: `${venue.name} (Click to zoom)`
      });
      // click event for each marker to display venue information
      marker.addListener('click', function() {
        map.panTo(marker.getPosition());
        map.setZoom(12);
        map.setCenter(marker.getPosition());
        document.querySelector('.info-address-card').innerHTML = 
        `<h3><strong>${venue.name}</strong></h3> <br>
        <h4><strong>Address:</strong> ${venue.address}</h4> <br>
        <h4><strong>Phone:</strong> ${venue.phone}</h4> <br>
        <h4><strong>Email:</strong> ${venue.email}</h4> <br>
        `;
      })
    })
  }

  addMarkers(gon.venues); // retrieves var through gon from VenuesController

};


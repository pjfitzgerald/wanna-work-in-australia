
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
        title: `${venue.name} (Click to focus)`
      });
      // click event for each marker to display venue information
      marker.addListener('click', function() {
        map.panTo(marker.getPosition());
        setTimeout(function() {
          map.setCenter(marker.getPosition());
          map.setZoom(12);
        }, 800);
        document.querySelector('.info-address-card').innerHTML = 
        `<h4><strong>${venue.name}</strong></h4> <br>
        <h6><strong>Address:<br></strong> ${venue.address}</h6> <br>
        <h6><strong>Phone:<br></strong> ${venue.phone}</h6> <br>
        <h6><strong>Email:<br></strong> ${venue.email}</h6> <br>
        <h6> <a style='position: absolute; width: 100%; text-align: center; bottom: 10px;' href='venues/${venue.id}'>Venue Details</a></h6>
        `;
      })
    })
  }

  addMarkers(gon.venues); // retrieves var through gon from VenuesController

};


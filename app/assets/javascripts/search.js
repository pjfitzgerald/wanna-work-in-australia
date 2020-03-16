var infowindow = new google.maps.infoWindow({
  maxWidth: 350
});

function initMap(lat, lng, initialZoom, venues) {
  const myCoords = new google.maps.LatLng(lat, lng);    // map initialisation location
  
  const mapOptions = {
    center: myCoords,
    zoom: initialZoom,
    disableDefaultUI: true,  // removes map/satellite and other intrusive UI elements
    styles: [
      {
        "elementType": "labels",
        "stylers": [
          {
            "visibility": "on"
          }
        ]
      },
      {
        "featureType": "administrative.land_parcel",
        "stylers": [
          {
            "visibility": "off"
          }
        ]
      },
      {
        "featureType": "administrative.neighborhood",
        "stylers": [
          {
            "visibility": "off"
          }
        ]
      }
    ]
  };
  
  const map = new google.maps.Map(document.getElementById('map'), mapOptions);
  
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
      
      /* ----- marker on-click events ----- */
      
      // display venue information on info-pane
      marker.addListener('click', function() {
        document.querySelector('.info-address-card').innerHTML = 
        `<h4><strong>${venue.name}</strong></h4> <br>
        <h6><strong>Address:<br></strong> ${venue.address}</h6> <br>
        <h6><strong>Phone:<br></strong> ${venue.phone}</h6> <br>
        <h6><strong>Email:<br></strong> ${venue.email}</h6> <br>
        <h6> <a style='position: absolute; width: 100%; text-align: center; bottom: 10px;' href='venues/${venue.id}'>Venue Details</a></h6>
        `;
      })
      
      // // pan, zoom and centre marker
      // marker.addListener('click', function() {
        //   map.panTo(marker.getPosition());
        //   setTimeout(function () {
          //     map.setCenter(marker.getPosition());
          //     map.setZoom(12);
          //   }, 800);
          // })
          
          
          // open infoWindow on marker
          
          // marker.addListener('click', function() {
          //   if (infowindow) {
          //     infowindow.close();
          //   }
          //   var infowindow = new google.maps.InfoWindow({
          //     content: 'test content for infoWindows'
          //   });
          //   infowindow.open(map, marker)
          // })
          
          marker.addListener('click', function() {
            if (infowindow) {
              infowindow.close();
            }
            infowindow.setContent('testing');
            infowindow.open(map, marker);
          })
        })
      }
      
      addMarkers(gon.venues); // retrieves var through gon from VenuesController
      
};
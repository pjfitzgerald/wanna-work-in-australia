const initMap = (lat, lng) => {
  const myCoords = new google.maps.LatLng(lat, lng);    // map initialisation location

  const mapOptions = {
    center: myCoords,
    zoom: 14
  };

  const map = new google.maps.Map(document.getElementById('map'), mapOptions);
  
  
  // geocoding to address on-click
  
  const geocoder = new google.maps.Geocoder();
  
  
  google.maps.event.addListener(map, 'click', (event) => {
    geocoder.geocode({
      'latLng': event.latLng
    }, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        if (results[0]) {
          let infoContainer = document.querySelector('.info-container')
          // console.log(infoContainer);
          infoContainer.innerHTML = `<h4>${results[0].formatted_address}</h4>`;
        }
      }
    })
  }
  );
  
};

const addMarkers = (venues) => {
  // venues.forEach((venue) => {
    // let venueCoords = new google.maps.Latlng(venue[1], venue[2]);
    // let marker = new google.maps.Marker({
    //   position: (venueCoords),
    //   map: map,
    //   animation: google.maps.Animation.DROP
    // });
    // console.log(venue);

    // console.log(typeof venues);
    // console.log(venues);
  // })

}
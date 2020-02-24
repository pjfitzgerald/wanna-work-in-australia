
// initiating map on page

function initMap(lat, lng) {
  const myCoords = new google.maps.LatLng(lat, lng);    // map initialisation location
  
  const mapOptions = {
    center: myCoords,
    zoom: 8
  };
  
  // setting map to variable for reference
  const map = new google.maps.Map(document.getElementById('map'), mapOptions);
  
  // geocoding to address on-click
  const geocoder = new google.maps.Geocoder();
  google.maps.event.addListener(map, 'click', (event) => {
    geocoder.geocode({
      'latLng': event.latLng
    }, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        if (results[0]) {
          // add result to info-address-card inside info-container
          document.querySelector('.info-address-card').innerHTML = `<h4><strong>Address:</strong> <br> ${results[0].formatted_address}</h4>`;
        }
      }
    })
  });
  // // takes address as input, creates a marker based on coordinates, places on map
  // function codeAddress(address) {
  //   geocoder.geocode({'address': address }, function (results, status) {
  //     if (status == google.maps.GeocoderStatus.OK) {
  //       var marker = new google.maps.Marker({
  //         map: map,
  //         position: results[0].geometry.location,
  //         animation: google.maps.Animation.DROP
  //       });
  //     } else {
  //       alert('Geocode was not successful for the following reason: ' + status);
  //     }
  //     console.log(`position: ${marker.position}`);
  //     console.log(results);
  //   });
  // }

  // // run above function for each address
  // venue_addresses.forEach(address => {
  //   codeAddress(address);
  // })
};






const addMarkers = (addresses) => {
  addresses.forEach((address) => {
    let addressCoords = new google.maps.Latlng(venue[1], venue[2]);
    let marker = new google.maps.Marker({
      position: (venueCoords),
      map: map,
      animation: google.maps.Animation.DROP
    });

  })


}







VENUE_COORDINATES = {
  "At The Heads": { "lat": -38.28393940000001, "lng": 144.4942574 },
  "Basils Farm": { "lat": -38.2380177, "lng": 144.6367946 },
  "Charlie Noble": { "lat": -38.26485419999999, "lng": 144.6699349 },
  "Little Creatures Brewery": { "lat": -38.1646813, "lng": 144.3615444 },
  "Oakdene Vineyards": { "lat": -38.2338412, "lng": 144.539003 },
  "Nicol's Paddock": { "lat": -38.2064618, "lng": 144.2983798 },
  "Blue Pyrenees Estate": { "lat": -37.0721167, "lng": 143.426953 },
  "Grampians Estate": { "lat": -37.1662614, "lng": 142.8669164 },
  "Harvest Halls Gap": { "lat": -37.1413091, "lng": 142.5196435 },
  "Hop Temple": { "lat": -37.5605359, "lng": 143.8567834 },
  "Old Green Bean": { "lat": -36.7587989, "lng": 144.2847773 },
  "Red Rock Olives": { "lat": -37.1767882, "lng": 142.5993753 },
  "Bright Brewery": { "lat": -36.7264105, "lng": 146.9620972 },
  "Chrismont": { "lat": -36.8214968, "lng": 146.4222567 },
  "Feathertop Winery": { "lat": -37.7769997, "lng": 147.6859953 },
  "Hub 62": { "lat": -36.14837199999999, "lng": 146.610689 },
  "Milawa Cheese Company": { "lat": -36.4343277, "lng": 146.4348112 },
  "The Pickled Sisters Café": { "lat": -36.022305, "lng": 146.3985964 },
  "St Leonards Vineyards": { "lat": -35.9766687, "lng": 146.4306778 },
  "Stefano's": { "lat": -34.1829712, "lng": 142.1633672 },
  "Taste at Rutherglen": { "lat": -36.0537289, "lng": 146.4595163 },
  "Spoons Riverside": { "lat": -35.3476211, "lng": 143.5641766 },
  "Provenance": { "lat": -36.3591912, "lng": 146.6878359 },
  "Daylesford Cider": { "lat": -37.3561041, "lng": 144.2009301 },
  "Duck Duck Goose & Larder": { "lat": -37.2446746, "lng": 144.4518614 },
  "Gisborne Peak Winery": { "lat": -37.5234218, "lng": 144.5951168 },
  "Lavandula Swiss Italian Farm": { "lat": -37.2732244, "lng": 144.10966 },
  "Sault ": { "lat": -37.3983683, "lng": 144.1232278 },
  "Tuki Trout Farm": { "lat": -37.333333, "lng": 143.95 },
  "Donna Maria": { "lat": -38.473603, "lng": 145.016667 },
  "The Cups Estate": { "lat": -38.3966876, "lng": 144.8506841 },
  "DOC": { "lat": -38.2172159, "lng": 145.0374951 },
  "The Epicurean Red Hill": { "lat": -38.3805436, "lng": 145.0258265 },
  "Green Olive at Red Hill": { "lat": -38.381694, "lng": 144.992988 },
  "Le Bouchon": { "lat": -38.37359259999999, "lng": 145.1237303 },
  "Main Ridge Dairy": { "lat": -38.388009, "lng": 144.973886 },
  "Montalto": { "lat": -38.4074243, "lng": 145.0266847 },
  "Yabby Lake Vineyard": { "lat": -38.273705, "lng": 145.081745 },
  "Coldstream Brewery": { "lat": -37.7568233, "lng": 145.3467403 },
  "Greenstone Vineyards": { "lat": -37.6595237, "lng": 145.3560612 },
  "Terindah Estate": { "lat": -38.13707060000001, "lng": 144.5945883 },
  "Wye General Store": { "lat": -38.6348293, "lng": 143.8904908 },
  "Jones Winery & Vineyard": { "lat": -36.06101700000001, "lng": 146.477438 },
  "The Cosmopolitan Hotel": { "lat": 40.05618, "lng": -85.549179 },
  "Paringa Estate": { "lat": -38.38908199999999, "lng": 145.037068 },
  "Healesville Hotel": { "lat": -37.6543798, "lng": 145.5159598 },
  "Mandala Wines": { "lat": -37.6121398, "lng": 145.4141914 },
  "Medhurst Wines": { "lat": -37.71887299999999, "lng": 145.4570571 },
  "Meletos": { "lat": -37.6923755, "lng": 145.4074003 },
  "Stones of the Yarra Valley": { "lat": -37.6915914, "lng": 145.4085975 },
  "Yarra Valley Dairy": { "lat": -37.6876245, "lng": 145.3862058 },
  "Yering Station": { "lat": -37.6733941, "lng": 145.3839126 },
  "Zonzo Estate": { "lat": -37.6633391, "lng": 145.4005761 }
}







const venue_addresses = [
  "Jetty Rd, Barwon Heads",
  "43-53 Nye Road, Swan Bay",
  "5/4 Wharf St East, Queenscliff",
  "221 Swanston St, Geelong South",
  "255 Grubb Rd, Wallington",
  "90 McAdams Ln, Bellarine",
  "35 Great Ocean Rd, Wye River",
  "35 Waurn Ponds Dr, Waurn Ponds",
  "Vinoca Rd, Avoca",
  "1477 Western Hwy, Great Western",
  "2 Heath St, Halls Gap"
]

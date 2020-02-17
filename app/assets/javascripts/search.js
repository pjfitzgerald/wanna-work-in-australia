
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

  function codeAddress(address) {
    geocoder.geocode({'address': address }, function (results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        var marker = new google.maps.Marker({
          map: map,
          position: results[0].geometry.location,
          animation: google.maps.Animation.DROP
        });
      } else {
        alert('Geocode was not successful for the following reason: ' + status);
      }
    });
  }

  venue_addresses.forEach(address => {
    codeAddress(address);
  })
};






// const addMarkers = (addresses) => {
//   addresses.forEach((address) => {
//     let addressCoords = new google.maps.Latlng(venue[1], venue[2]);
//     let marker = new google.maps.Marker({
//       position: (venueCoords),
//       map: map,
//       animation: google.maps.Animation.DROP
//     });

//   })


// }















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

"24-28 Armstong St North, Ballarat",
"179 Lyttleton Tce, Bendigo",
"3594 Ararat-Halls Gap Rd, Pomonal",
"121 Great Alpine Rd, Bright",
"251 Upper King River Rd, Cheshunt",
"619 Great Alpine Rd, Porepunkah",
"62 Main St, Chiltern",
"61 Jones Road, Rutherglen",
"17 Factory Road, Milawa",
"Cofield Wines, Distillery Rd, Wahgunyah",
"201 St Leonards Road, Wahgunyah",
"Cellars of the Grand Hotel, Langtree Avenue, Mildura",
"125 Monash Drive, Swan Hill",
"86 Ford St, Beechworth",
"Cnr High St & Cosmo Road, Trentham",
"155 Dairy Flat Rd, Musk",
"17-21 Piper St, Kyneton",
"69 Short Rd, Gisborne",
"350 Hepburn-Newstead Rd, Shepherds Flat",
"2349 Ballan Daylesford Rd, Daylesford",
"60 Stoney Rise Rd, Smeaton ",
"52 Cook St, Flinders",
"269 Browns Rd. Fingal",
"22 Main St, Mornington",
"165 Shoreham Rd, Red Hill South",
"1180 Mornington Flinders Rd, Main Ridge",
"10 Russel St, Balnarring",
"295 Main Creek Rd, Main Ridge",
"33 Shoreham Rd, Red Hill South",
"44 Paringa Rd, Red Hill South",
"86-112 Tuerong Rd, Tuerong",
"94 Maroondah Hwy, Coldstream",
"179 Glenview Rd, Yarra Glen",
"256 Maroondah Hwy, Healesville",
"1568 Melba Highway, Dixons Creek",
"24-26 Medhurst Rd, Gruyere",
"12 St Huberts Rd, Coldstream",
"14 St Huberts Rd, Coldstream",
"70-80 McMeikans Rd, Yering",
"38 Mjelba Highway, Yarra Glen",
"957 Healesville-Yarra Glen Rd, Yarra Glen"
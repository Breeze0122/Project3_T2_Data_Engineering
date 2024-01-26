// Create a map object.
let myMap = L.map("map", {
    center: [37.09, -45.71],
    zoom: 2.5,
  });
  
  // Add a tile layer.
  L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
    attribution:
      '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors',
  }).addTo(myMap);
  
  // Define a markerSize() function that gives each city a different radius based on its median salary.
  function markerSize(proportion) {
    return Math.sqrt(proportion) * 25000;
  }
  
  // Loop through the cities array and create one marker for each city object.
  for (let i = 0; i < cities.length; i++) {
    // Conditionals for country proportion
    let color = "";
    if (cities[i].proportion < 100) {
      color = "red";
    } else if (cities[i].proportion < 250) {
      color = "blue";
    } else if (cities[i].proportion < 400) {
      color = "green";
    } else if (cities[i].proportion < 700) {
        color = "yellow";
    } else {
      color = "violet";
    }
  
    // Create a marker with a circle and add it to the map.
    let marker = L.circle(cities[i].location, {
      fillOpacity: 0.75,
      color: "blue",
      fillColor: color,
      radius: markerSize(cities[i].proportion),
    });
  
    // Bind a popup to the marker with city information.
    marker
      .bindPopup(`
          <h1>${cities[i].name}</h1> 
          <hr> 
          <h3>Median Salary: $${cities[i].Median_salary.toLocaleString()}</h3>
          <h3>Max Salary: $${cities[i].Max_salary.toLocaleString()}</h3>
          <h3>Min Salary: $${cities[i].Minimum_salary.toLocaleString()}</h3>
          <h3>Average Country Salary : $${cities[i].Yearly_Average_salary.toLocaleString()}</h3>
      `)
      .addTo(myMap);
  }
  
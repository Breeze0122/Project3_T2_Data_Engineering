// Create a map object.
let myMap = L.map("map", {
    center: [37.09, -45.71],
    zoom: 2.5
});

// Add a tile layer.
L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
}).addTo(myMap);

// Define a markerSize() function that gives each city a different radius based on its median salary.
function markerSize(proportion) {
    return Math.sqrt((proportion) * 100000000);
}

// Loop through the cities array and create one marker for each city object.
for (let i = 0; i < cities.length; i++) {
    const city = cities[i];
    const marker = L.circle(city.location, {
        fillOpacity: 0.75,
        color: "blue",
        fillColor: "purple",
        radius: markerSize(city.proportion)
    });



    
    // Bind a popup to the marker with city information.
    marker.bindPopup(`
        <h1>${city.name}</h1> 
        <hr> 
        <h3>Median Salary: $${city.Median_salary.toLocaleString()}</h3>
        <h3>Max Salary: $${city.Max_salary.toLocaleString()}</h3>
        <h3>Min Salary: $${city.Minimum_salary.toLocaleString()}</h3>
        <h3>Average Country Salary : $${city.Yearly_Average_salary.toLocaleString()}</h3>
    `).addTo(myMap);
}

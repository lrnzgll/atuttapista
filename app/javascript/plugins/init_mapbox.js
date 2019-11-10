import mapboxgl from 'mapbox-gl';


const initMapbox = () => {

  const mapElement = document.querySelector('#profile-map');

  if (mapElement) {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'profile-map',
      style: 'mapbox://styles/mapbox/streets-v11',
      zoom: 9 // starting zoom
    });
    const marker = JSON.parse(mapElement.dataset.marker);
    new mapboxgl.Marker().setLngLat( [ marker.lng, marker.lat ] ).addTo(map);
    const bounds = new mapboxgl.LngLatBounds();
    bounds.extend([ marker.lng, marker.lat ]);
    map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
    if (mapDiv.style.visibility === true) map.resize();
  }
};

export { initMapbox };
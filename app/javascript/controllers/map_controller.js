import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
  }

  connect() {
    console.log("Controller loaded!");
    mapboxgl.accessToken = this.apiKeyValue
    console.log("Hello");
    this.map = new mapboxgl.Map({
      container: this.element, // container ID
      style: 'mapbox://styles/mapbox/streets-v10',// style URL
      zoom: 2
    });
    this.#addMarkersToMap()
  }
    #addMarkersToMap() {
      this.markersValue.forEach((marker) => {
        new mapboxgl.Marker()
          .setLngLat([ marker.lng, marker.lat ])
          .addTo(this.map)
    })
  }

}

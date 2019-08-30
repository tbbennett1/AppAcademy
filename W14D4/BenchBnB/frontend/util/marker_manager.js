export default class MarkerManager {
    constructor(map) {
        this.map = map;
        this.markers = {};
        this.updateMarkers = this.updateMarkers.bind(this)
    }

    updateMarkers(benches) {
        benches.forEach(bench => {
            if (!this.markers[bench.id]){

                const myLatlng = new google.maps.LatLng(bench.lat, bench.lng);

                const marker = new google.maps.Marker({
                    position: myLatlng,
                    map: this.map
                })
                // debugger
            }
        })
    }
}


import { LightningElement } from 'lwc';
//import HereMapsJS from '@salesforce/resourceUrl/HereMapsJS';
// import mapService from '@salesforce/resourceUrl/mapService';
// import mapCore from '@salesforce/resourceUrl/mapCore';
// import mapEvents from '@salesforce/resourceUrl/mapEvents';
// import mapUI from '@salesforce/resourceUrl/mapUI';
import Test from '@salesforce/resourceUrl/Test';
import { loadStyle, loadScript } from 'lightning/platformResourceLoader';
export default class TestMap extends LightningElement {
    // mapMarkers = [{
    //     location: {
    //         Latitude: '37.790197',
    //         Longitude: '-122.396879'
    //     }
    // }];

    connectedCallback(){
        Promise.all([
            //loadScript(this, HereMapsJS),
            // loadScript(this,mapService),
            // loadScript(this, mapCore),
            // loadScript(this,mapEvents),
            loadScript(this, Test),
            //loadScript(this, mapUI)
        ]).then(response =>{
            console.log("script Loaded");
            // var platform = new H.service.Platform({
            //     'apikey': '{7p6TbvkfCCSDOaSLFp7WoOrnO60sApZSp2WbCgwXEEQ}'
            //   });
            //   console.log("Platform elemen t done");
            //   // Retrieve the target element for the map:
            //   var targetElement = this.template.querySelector('canvas');
            //   console.log("target Element set");
            //   // Get the default map types from the platform object:
            //   var defaultLayers = platform.createDefaultLayers();
            //   console.log("Got Map Default values");
            //   // Instantiate the map:
            //   var map = new H.Map(
            //     this.template.querySelector('canvas'),
            //     defaultLayers.vector.normal.map,
            //     {
            //       zoom: 10,
            //       center: { lat: 52.51, lng: 13.4 }
            //     });
            //     console.log("map instantiated");
            //   // Create the parameters for the routing request:
            //   var routingParameters = {
            //     'routingMode': 'fast',
            //     'transportMode': 'car',
            //     // The start point of the route:
            //     'origin': '50.1120423728813,8.68340740740811',
            //     // The end point of the route:
            //     'destination': '52.5309916298853,13.3846220493377',
            //     // Include the route shape in the response
            //     'return': 'polyline'
            //   };
            //   console.log("Create the parameters for the routing request:");
            //   // Define a callback function to process the routing response:
            //   var onResult = function(result) {
            //     // ensure that at least one route was found
            //     if (result.routes.length) {
            //       result.routes[0].sections.forEach((section) => {
            //            // Create a linestring to use as a point source for the route line
            //           let linestring = H.geo.LineString.fromFlexiblePolyline(section.polyline);
              
            //           // Create a polyline to display the route:
            //           let routeLine = new H.map.Polyline(linestring, {
            //             style: { strokeColor: 'blue', lineWidth: 3 }
            //           });
              
            //           // Create a marker for the start point:
            //           let startMarker = new H.map.Marker(section.departure.place.location);
              
            //           // Create a marker for the end point:
            //           let endMarker = new H.map.Marker(section.arrival.place.location);
              
            //           // Add the route polyline and the two markers to the map:
            //           map.addObjects([routeLine, startMarker, endMarker]);
              
            //           // Set the map's viewport to make the whole route visible:
            //           map.getViewModel().setLookAtData({bounds: routeLine.getBoundingBox()});
            //       });
            //     }
            //   };
            //   console.log("onresult got Occured")
            //   // Get an instance of the routing service version 8:
            //   var router = platform.getRoutingService(null, 8);
              
            //   // Call calculateRoute() with the routing parameters,
            //   // the callback and an error callback function (called if a
            //   // communication error occurs):
            //   console.log("RS Occured")
            //   router.calculateRoute(routingParameters, onResult,
            //     function(error) {
            //       alert(error.message);
            //     });

        // const platform = new H.service.Platform({apikey: '7p6TbvkfCCSDOaSLFp7WoOrnO60sApZSp2WbCgwXEEQ'});
        // const defaultLayers = platform.createDefaultLayers();
        // const map = new H.Map(this.template.querySelector('canvas'),
        //     defaultLayers.vector.normal.map,
        //     {
        //         center: {lat: '', lng: ''},
        //         zoom: 3,
        //         pixelRatio: window.devicePixelRatio || 1
        //     });
        // window.addEventListener('resize', () => map.getViewPort().resize());
        // const behavior = new H.mapevents.Behavior(new H.mapevents.MapEvents(map));
        // const ui = H.ui.UI.createDefault(map, defaultLayers);

        // //Begin geocoding
        // const searchText = 'Pune';
        // const geocoder = platform.getGeocodingService();
        // geocoder.geocode({searchText}, result => {
        //     const location = result.Response.View[0].Result[0].Location.DisplayPosition;
        //     const {Latitude: lat, Longitude: lng} = location;
        //     const marker = new H.map.Marker({lat, lng});
        //     map.addObject(marker);
        //});
        }).catch(error => {
            console.log("error Occured")
        });
 
    }
    // Instantiate a map and platform object:

  
}
Vue.component('wms-layer', VueGoogleMap.MapComponent.extend({
	template: '',
	props: ['layer'],
	ready: function(){
		//console.log("ready");
	},
	deferredReady: function(){
		//console.log("deferredReady");
		var self = this;
		var splitlyrids;
		//console.log(this.$map);

		/* Not sure why/if service and overlay have to be $ on the component (this). Since we also need it on the layer I'm trying to just copy it from $. - clarson 8/16/18 */

		/*this.$service = new gmaps.ags.MapService(self.layer.url, 
		/* token required, copied from map-service-layer to match *
			{__TOKEN: self.layer.token || null, __LAYERSETTINGS: self.layer});
		this.layer.mapService = this.$service;*/

		/* Copied from maps.COL
		   - svg_map.map => this.$map
		   - _layer => this.layer
		   -
		- clarson 8/16/18 */

		//Remove trailing slash
		var _cleanUrl_1 = (this.layer.url.substr(self.layer.url.length-1) == "/" ? self.layer.url.substr(0,self.layer.url.length-1) : self.layer.url);
		var _cleanUrl_2 = (this.layer.url.substr(self.layer.url.length-5) == "/Tile" ? self.layer.url.substr(0,self.layer.url.length-5) : self.layer.url);
		//WMS URL
		var _wmsUrl = _cleanUrl_1.replace("/rest","") + "/WMSServer?&REQUEST=GetMap&SERVICE=WMS&VERSION=1.3";
		//Layer info url
		var _layerInfoUrl = _cleanUrl_2 + "/?f=pjson";
		
		console.log(_cleanUrl_2);
		console.log(this.layer.url);
		
		var options = {
			jsonp: 'callback',
			f: 'pjson'
		}
		console.log(this.$http);
		/* this is angular isn't it - clarson 8/16/18 */
		//this.$http.jsonp(_cleanUrl_1 + "&callback=JSON_CALLBACK").then(
		//this.$http.jsonp(_cleanUrl_2, options).then(
		this.$http.get(_layerInfoUrl).then(
		function(response) {
			var _data = response
			var _layerCount = _data.layers.length;
			var _layerIdList = []; 
			var _styleList = []; 
			for (var i = 0; i < _layerCount; i++){
				_layerIdList.push(i);
				_styleList.push("default");
			}
			var wmsOptions = {
				alt: "Test",
				getTileUrl: function (tile, zoom) {
					var projection = self.$map.getProjection();
					var zpow = Math.pow(2, zoom);
					var ul = new google.maps.Point(tile.x * 256.0 / zpow, (tile.y + 1) * 256.0 / zpow);
					var lr = new google.maps.Point((tile.x + 1) * 256.0 / zpow, (tile.y) * 256.0 / zpow);
					var ulw = projection.fromPointToLatLng(ul);
					var lrw = projection.fromPointToLatLng(lr);
					var format = "image/png"; //type of image returned  or image/jpeg
					var layers = _layerIdList.join(","); 
					var styles = _styleList.join(",");
					var srs = "EPSG:4326"; //projection to display. This is the projection of google map. Don't change unless you know what you are doing.
					var bbox = ulw.lat() + "," + ulw.lng() + "," + lrw.lat() + "," + lrw.lng();
					//Add the components of the URL together
					var url = _wmsUrl + "&LAYERS=" + layers + "&Styles=" + styles + "&SRS=" + srs + "&BBOX=" + bbox + "&width=256" + "&height=256" + "&format=" + format + "&BGCOLOR=0xFFFFFF&TRANSPARENT=true" + "&reaspect=false" + "&CRS=EPSG:4326";
					return url;
				},
				isPng: false,
				maxZoom: 17,
				minZoom: 1,
				name: "Test",
				tileSize: new google.maps.Size(256, 256)									
			};
	
			//Creating the object to create the ImageMapType that will call the WMS Layer Options.	
			self.$overlay = new google.maps.ImageMapType(wmsOptions);
			self.layer.mapOverlay = self.$overlay

			self.$overlay.setOpacity(parseFloat(self.layer.opacity));				
			//self.$map.overlayMapTypes.insertAt(0,self.$overlay);
			this.$map.overlayMapTypes.push(self.$overlay);

			self.layer.isloading = false;
		}, function (response) {
			// error callback
			alert("Error loading WMS Layer " + self.layer.label);
		});
	},
	destroyed: function(){
		var self = this;
		console.log("destroy " + self.layer.id + ', index ' + self.layer.mapTypeIndex)
		this.$map.overlayMapTypes.removeAt(self.layer.mapTypeIndex);
		this.layer.mapTypeIndex = null;
		//this.$map.overlayMapTypes.removeAt(0);
	}
}));
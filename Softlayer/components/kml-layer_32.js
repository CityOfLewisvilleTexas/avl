Vue.component('kml-layer', VueGoogleMap.MapComponent.extend({
	template: '',
	props: ['layer'],
	deferredReady: function(){
		var self = this;
		//console.log(this);
		//console.log(this.$map);
		this.$overlay = new google.maps.KmlLayer({
			url: self.layer.url,
			map: self.$map,
			preserveViewport: true
		});
		this.layer.mapOverlay = this.$overlay;

		this.layer.isloading = false;

		if (this.layer.refreshinterval){
			this.layer.toggleInterval = setInterval(function(){
				self.layer.isloading = true;

				// should set $kml to null?
				self.$overlay = new google.maps.KmlLayer({
					url: self.layer.url,
					map: self.$map,
					preserveViewport: true
				});
				// do we need to set this again?
				self.layer.mapOverlay = self.$overlay;
				
				self.layer.isloading = false;

			}, (self.layer.refreshinterval * 1000));
			
		}
	},
	destroyed: function(){
		// nothing to put here? ...
		this.layer.mapOverlay = null	/* Clear this too - clarson 8/16/18 */
		this.$overlay.setMap(null);

		/* this was changed in the component, probably bad - clarson 8/16/18 */
		this.layer.toggleInterval = null;
		/* this was changed in the component/arcgislink, probably bad - clarson 8/16/18 */
		this.layer.isloading = false;
	}
}));
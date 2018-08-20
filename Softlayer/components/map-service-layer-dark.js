Vue.component('map-service-layer-dark', VueGoogleMap.MapComponent.extend({
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
		
		/* I don't know if the url part can be put in here because it wouldn't create a new MapOverlay. Not sure if it's worth destroying overlay (and service?) in here somewhere instead of just using a different component for dark - clarson 8/16/18 */

		// Added layerids to handle error, haven't tested functionality
		/* Modified according to maps.COL copied 8/14/18. Kept it ahead of MapOverlay creation instead of modifying MapOverlay after - clarson 8/16/18 */
		if (this.layer.layerids.length > 0){
			splitlyrids = this.layer.layerids.split(","); /* My code previously just called split, but has to be set as var (split dosn't change original string) - clarson 8/16/18 */
		}

		/* Not sure why/if service and overlay have to be $ on the component (this). Since we also need it on the layer I'm trying to just copy it from $. - clarson 8/16/18 */

		this.$service = new gmaps.ags.MapService(self.layer.urldark,
			/* Changed to match maps.COL copied 8/14/18 - clarson 8/16/18 */
			/*{layerids: self.layer.layerids}*/
			{__TOKEN: self.layer.token || null, __LAYERSETTINGS: self.layer}
		);
		this.layer.mapService = this.$service;
		
		this.$overlay = new gmaps.ags.MapOverlay(self.$service, {	/* Why was it this instead of self until now? - clarson 8/16/18 */
			opacity: self.layer.opacity,

			__ZINDEX: 1000 + self.layer.toggleOrder,
			/* ??? CHECK - do I change the toggleOrder to match Jason's?
			   I think it's because I would have to have access to app (and .toggleOrder on app) here for this. Maybe $emit, but would have to go through VGM.
			   It should be fine to change the layer property as long as .toggleOrder would only be changed when .active is changed (component would be destroyed and recreated, so new MapOverlay would be created)
			 - clarson 8/16/18 */
			/*__ZINDEX: (1000 + svc.toggleOrder.indexOf(_layer.id)),*/        // <---Custom property added to arcgislink.js module by JKIRKLAND 10/2016	
			
			__doOnDrawStart: function(){                                  // <---Custom property added to arcgislink.js module by JKIRKLAND 10/2016										
				setTimeout(function(){			/* Jason used $timeout which is Angular, use Window method instead - clarson 8/16/18 */
					self.layer.isloading = true;
				},1)
			},

			__doOnDrawEnd: function(){                                    // <---Custom property added to arcgislink.js module by JKIRKLAND 10/2016										
				setTimeout(function(){			/* Jason used $timeout which is Angular, use Window method instead - clarson 8/16/18 */
					/* Where did this come from? It's not in Jason's (anymore 8/16) - clarson 8/16/18 */
					if(self.layer.legendshow.toLowerCase() == "true"){
						//console.log(self.$service.layers[0].legend);
						self.layer.legend = self.$service.layers[0].legend;
					}
					self.layer.isloading = false;
				},1)
			},

			/* Added to match maps.COL copied 8/14/18 - clarson 8/16/18 */
			exportOptions: {											//export end-point ; line 2144 in arcgislink.js ; example: http://adaptergis.cityoflewisville.com/arcgis/rest/services/TrackStarLatestPositions/MapServer/export?bbox=-97.01418258182733%2C33.04209778042853%2C-96.96103751112796%2C33.06311440157349&bboxSR=&layers=&layerDefs=%7B%220%22%3A%22Department%3D%27Inspection+%26+Permitting%27%22%7D&size=&imageSR=&format=png&transparent=false&dpi=&time=&layerTimeOptions=&dynamicLayers=&gdbVersion=&mapScale=&f=image
				layerDefinitions: null
			},

			/* Attempting to set at creation instead of after the fact, different that Jason's - clarson 8/16/18 */
			exportOptions_: {
				layerIds: splitlyrids
			},

			/* Try adding the id here so arcgislink doesn't expect a different parameter (meaning I'd have to find and change that in maps.COL unnecessarily) - clarson 8/16/18 */
			__id: self.layer.id
		});
		this.layer.mapOverlay = this.$overlay;	/* Note: Jason's is lowercase - clarson 8/16/18 */
		
		this.$overlay.setMap(this.$map);
		
		/* What is this refresh interval
		   - do we want it
		   - should it change anything about listening for user moving map on idle?
		- clarson 8/16/18 */
		if (this.layer.refreshinterval){
			this.layer.toggleInterval = setInterval( function(){		/* Jason used $interval which is Angular, use Window method instead (is there a Vue method???) - clarson 8/16/18 */
				self.$overlay.refreshOnInterval();								/* Does it matter that it's not on this.layer.mapOverlay??? (is it a pointer/reference so both will change or is it a copy) - clarson 8/16/18 */
			}, (self.layer.refreshinterval * 1000));
		}

	},
	destroyed: function(){
		this.layer.mapOverlay = null	/* Clear this too/first? - clarson 8/16/18 */
		this.$overlay.setMap(null);
		/* ??? what about mapservice ??? - clarson 8/16/18 */

		/* this was changed in the component, probably bad - clarson 8/16/18 */
		this.layer.toggleInterval = null;
		/* this was changed in the component/arcgislink, probably bad - clarson 8/16/18 */
		this.layer.isloading = false;
	}
}));
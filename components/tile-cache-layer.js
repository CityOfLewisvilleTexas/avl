Vue.component('tile-cache-layer', VueGoogleMap.MapComponent.extend({
	template: '',
	props: ['layer'],
	deferredReady: function(){
		var self = this;
		var url = this.layer.url + (this.layer.url.substr(this.layer.url.length - 1) == '/' ? '' : '/');
		//var lyrimgmaptype;
		//console.log(this.layer);

		/* no longer in Jason's, originally copied from Jason's - clarson 8/16/18 */
		/*function padZeros(number, length){
			var str = '' + number;
			while(str.length < length){
				str = '0' + str;
			}
			return str;
		}*/
		
		if( this.layer.url.toLowerCase().indexOf("/mapserver/tile") > 0 ){
			/* modified to match maps.COL copied 8/14/18 - clarson 8/16/18 */

			this.$overlay = new google.maps.ImageMapType({			/*  ??? CHECK reason for this vs using var lyrimgmaptype??? - clarson 8/16/18 */
				getTileUrl: function(coord, zoom){
					return url + zoom + '/' + coord.y + '/' + coord.x + "?" + (new Date()).getTime();
				},
				tileSize: new google.maps.Size(256, 256),
				name: self.layer.label,					/* not sure why I had Topo (ESRI) for all - clarson 8/16/18 */
				maxZoom: 19,
				opacity: parseFloat(self.layer.opacity)		/* added from maps.COL copied 8/14/18 - clarson 8/16/18 */
			});
			this.layer.mapOverlay = this.$overlay;
			//console.log(this.layer.mapOverlay);
			
			
			this.$map.overlayMapTypes.push(self.$overlay);
			//this.$map.mapTypes.set(self.layer.id);
		}
		/* no longer in Jason's, originally copied from Jason's - clarson 8/16/18 */
		/*else{
			if( url.indexOf("/layers/_alllayers") == -1 ){
				url = url + "layers/_alllayers/";
			}
			this.$map.mapTypes.set(this.layer.id, new google.maps.ImageMapType({
				getTileUrl: function(coord, zoom){
					var z = padZeros(zoom, 2);
					var x = padZeros(coord.x.toString(16), 8);
					var y = padZeros(coord.y.toString(16), 8);
					
					return url + 'L' + z + '/R' + y + '/C' + x + '.png';
					
				},
				tileSize: new google.maps.Size(256, 256),
				name: this.layer.id,
				maxZoom: 19
			}));
		}*/
		
		//this.$map.setMapTypeId(this.layer.id);???
		this.layer.isloading = false;
		
	},
	destroyed: function(){
		var self = this;
		//console.log("destroy " + self.layer.id + ', index ' + self.layer.mapTypeIndex)
		this.$map.overlayMapTypes.removeAt(self.layer.mapTypeIndex);
		this.layer.mapTypeIndex = null;
		//this.$map.setMapTypeId(google.maps.MapTypeId.ROADMAP);

		/* ??? CHECK WMS is removed with the following, but is always inserted at 0 - clarson 8/16/18 */
		/*this.$map.overlayMapTypes.removeAt(0);*/


		/* [FUTURE] No interval for Tile Cache */
		/* this was changed in the component, probably bad - clarson 8/16/18 */
		/*this.layer.toggleInterval = null;
		/* this was changed in the component/arcgislink, probably bad - clarson 8/16/18 */
		/*this.layer.isloading = false;*/
	}
}));
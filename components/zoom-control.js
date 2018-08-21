Vue.component('zoom-control', VueGoogleMap.MapComponent.extend({
	props: '',
	template: '',
	data: function(){
		return {
			inActive: false,
			outActive: false,
			inTimeout: '',
			outTimeout: ''
		}
	},
	deferredReady: function(){
		var self = this;
		
		var controlDiv = document.createElement('div');
		
		var controlWrapper = document.createElement('div');
		controlWrapper.className += ' zoomWrapper';
		controlDiv.appendChild(controlWrapper);

		var zoomInButton = document.createElement('div');
		var zoomOutButton = document.createElement('div');

		zoomInButton.className += ' zoomButton';
		zoomInButton.title = "Zoom In";
		controlWrapper.appendChild(zoomInButton);

		zoomOutButton.className += ' zoomButton';
		zoomOutButton.title = "Zoom Out";
		controlWrapper.appendChild(zoomOutButton);
		
		/*var controlText1 = document.createElement('div');
		controlText1.className += ' controlText controlBold';
		zoomInButton.appendChild(controlText1);*/
		var controlglyph1 = document.createElement('span');
		controlglyph1.className += ' glyphicon glyphicon-plus';
		zoomInButton.appendChild(controlglyph1);

		zoomInButton.addEventListener('click', function() {
			console.log("click in");
			var button = this;
			if(!self.inActive){
				self.inActive = true;
				button.classList.add("darken");
				self.inTimeout = setTimeout(function(){
					self.inActive = false
					button.classList.remove("darken");
				}, 500)
			}
			else{
				clearTimeout(self.inTimeout);
				self.inTimeout = setTimeout(function(){
					self.inActive = false
					button.classList.remove("darken");
				}, 500)
			}
			self.$map.setZoom(++app.zoomV);
        });

        /*var controlText2 = document.createElement('div');
		controlText2.className += 'controlText controlBold';
		zoomOutButton.appendChild(controlText2);*/
		var controlglyph2 = document.createElement('span');
		controlglyph2.className += ' glyphicon glyphicon-minus';
		zoomOutButton.appendChild(controlglyph2);

		zoomOutButton.addEventListener('click', function() {
			console.log("click out");
			var button = this;
			if(!self.outActive){
				self.outActive = true;
				button.classList.add("darken");
				self.outTimeout = setTimeout(function(){
					self.outActive = false
					button.classList.remove("darken");
				}, 500)
			}
			else{
				clearTimeout(self.outTimeout);
				self.outTimeout = setTimeout(function(){
					self.outActive = false
					button.classList.remove("darken");
				}, 500)
			}
			self.$map.setZoom(--app.zoomV);
        });
		
		controlDiv.index = 0;
		//console.log(this.$map.controls[google.maps.ControlPosition.RIGHT_BOTTOM].length);
		this.$map.controls[google.maps.ControlPosition.RIGHT_BOTTOM].push(controlDiv);
	},
	destroyed: function(){
	}
}));
<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>
<!DOCTYPE html>
<html lang="en-US">
<head>

	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />	
    <title>AVL</title>
	
	<!--Icons (in a folder named "icons")-->
	<link rel="apple-touch-icon" sizes="57x57" href="icons/apple-touch-icon-57x57.png">
	<link rel="apple-touch-icon" sizes="60x60" href="icons/apple-touch-icon-60x60.png">
	<link rel="apple-touch-icon" sizes="72x72" href="icons/apple-touch-icon-72x72.png">
	<link rel="apple-touch-icon" sizes="76x76" href="icons/apple-touch-icon-76x76.png">
	<link rel="apple-touch-icon" sizes="114x114" href="icons/apple-touch-icon-114x114.png">
	<link rel="apple-touch-icon" sizes="120x120" href="icons/apple-touch-icon-120x120.png">
	<link rel="icon" type="image/png" href="icons/favicon-32x32.png" sizes="32x32">
	<link rel="icon" type="image/png" href="icons/favicon-96x96.png" sizes="96x96">
	<link rel="icon" type="image/png" href="icons/favicon-16x16.png" sizes="16x16">
	<link rel="mask-icon" href="icons/safari-pinned-tab.svg" color="#5bbad5">
	<link rel="shortcut icon" href="icons/favicon.ico">
	<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700" rel="stylesheet">


	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<!--<link rel="stylesheet" href="stylesheets/bootstrapMod.css">-->
	<!-- Night modifications for Bootstrap -->
	<link rel="stylesheet" href="stylesheets/bootstrapNight.css">
	<!-- Custom Stylesheet -->
    <link rel="stylesheet" href="stylesheets/app_beta.css">
	
	<!-- JQUERY for LiveData -->
	<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
	
	<!-- Vue, development version -->
	<!--<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/1.0.28/vue.js"></script>-->
	<!-- Vue, min version -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/1.0.28/vue.min.js"></script>
	
	<!-- Bootstrap JS -->
	<!--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>-->
	
	<!-- VueStrap -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/vue-strap/1.1.36/vue-strap.min.js"></script>
	
	<!-- Lodash -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.6.1/lodash.min.js"></script>

	<!-- Vue Google Map -->
	<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/vue-google-maps/0.1.21/vue-google-maps.js"></script> -->
	<script src="scripts/vue-google-maps-0.1.21_v2.js"></script>
	
	<!-- find -->
	<script src="https://cdn.polyfill.io/v2/polyfill.min.js?features=Array.prototype.find,Array.prototype.findIndex,String.prototype.endsWith"></script>
	
	<!-- moment -->
	<script src="scripts/moment.min.js"></script>
	
	<!-- vue-resource -->
	<script src="https://cdn.jsdelivr.net/vue.resource/1.0.3/vue-resource.min.js"></script>
	
	<!-- Security -->
	<!--<script src="http://eservices.cityoflewisville.com/COLSecurity/col_security.js"></script>-->
	
	<!-- Socket ? -->
	<!--<script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/1.4.5/socket.io.min.js"></script>-->
	
	<!-- LiveData -->
	<!--<script src="http://eservices.cityoflewisville.com/livedata/live-data.js"></script>-->
	<!--<script src="scripts/live-data.js"></script>-->
	
	<!--Google Analytics-->
	<!--https://www.google.com/analytics/web/?authuser=0#realtime/rt-content/a35815214w63720524p65383322/-->
	<!--<script type="text/javascript"> var _gaq = _gaq || []; _gaq.push(['_setAccount', 'UA-35815214-1']); _gaq.push(['_trackPageview']); (function () { var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true; ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js'; var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s); })(); </script>
	<!---------------------------------->
	
	<script src="components/traffic-control.js"></script>
	<script src="components/night-control.js"></script>
	<script src="components/center-control_v2.js"></script>
	<script src="components/traffic-layer.js"></script>
	<script src="components/kml-layer.js"></script>
	<script src="components/map-service-obj.js"></script>
	<script src="components/tile-cache-obj.js"></script>
	<!--<script src="components/bs-place-input.js"></script>-->
	
	<script type="text/javascript" language="javascript">
		var hashstring = location.hash;
	</script>
	
</head>

<body>

<div id="app" class="container-fluid" :class="[{night: nightMode, addClose: showCloseAll}]">
	<navbar placement="top" type="default">
		<span slot="brand">
			<a class="hidden-xs hidden-md navbar-left"><img class="nav-city-logo" alt="Brand" src="http://metrics.cityoflewisville.com/images/citylogo.svg"/></a>
			<a class="navbar-brand">AVL</a>
			
				<button-group :value.sync="radioValue" type="default" class="hidden-lg hidden-md btn-group-med navBtn">
					<radio value="Map">Map</radio>
					<radio value="Both">Both</radio>
					<radio value="List">List</radio>
				</button-group>
				<!--<ul class="brand-ul">-->
				<dropdown slot="right" class="pull-right hide-out-collapse">
					<button slot="button" class="btn btn-link navbar-btn dropdown-toggle" v-show="filterNotes_New.length > 0"><span class="badge">{{filterNotes_New.length}} <span class="caret"></span></span></button>
					<li v-for="call in filterCalls_NewNote"><a v-on:click="clickCallNotification(call)">{{call.complaint}} <span class="badge">{{filterNotesByCallNumber_New(call.callnumber).length}}</span></a></li>
				</dropdown>
				<!--</ul>-->
		</span>
	
		<!--<li><a v-on:click="clickCenterMap">Center Map</a></li>-->
		<li v-bind:class="[{active: showNarrative}]"><a role="button" v-on:click="showNarrative=!(showNarrative)">Narrative <span class="small glyphicon" v-bind:class="[{'glyphicon-remove': showNarrative, 'glyphicon-plus': !(showNarrative)}]"></span></a></li>
		<li v-bind:class="[{active: showGIS}]" class="hidden-xs"><a role="button" v-on:click="showGIS=!(showGIS)">GIS Layers <span class="small glyphicon" v-bind:class="[{'glyphicon-remove': showGIS, 'glyphicon-plus': !(showGIS)}]"></span></a></li>
		<!--<li v-bind:class="[{active: showTrafficLayer}]"><a v-on:click="showTrafficLayer=!(showTrafficLayer)">Traffic Layer <span class="small glyphicon" v-bind:class="[{'glyphicon-remove': showTrafficLayer, 'glyphicon-plus': !(showTrafficLayer)}]"></span></a></li>-->
		<li v-bind:class="[{active: showVehicles}]" class="hidden-xs"><a role="button" v-on:click="showVehicles=!(showVehicles)">Vehicles <span class="small glyphicon" v-bind:class="[{'glyphicon-remove': showVehicles, 'glyphicon-plus': !(showVehicles)}]"></span></a></li>
		
		<dropdown text="Filter">
			<li v-bind:class="[{active: showP9}]"><a v-on:click="showP9 = !(showP9)">Priority 9 <span class="glyphicon glyphicon-ok" v-show="showP9"></span></a></li>
			<li class="divider"></li>
			<li class="dropdown-header">Department</li>
			<li class="li-group" v-bind:class="[{active: department == 'ALL'}]"><a v-on:click="department='ALL'">ALL <span class="glyphicon glyphicon-ok" v-show="department == 'ALL'"></span></a></li>
			<li class="li-group" v-bind:class="[{active: department == 'POL'}]"><a v-on:click="department='POL'">POLICE <span class="glyphicon glyphicon-ok" v-show="department == 'POL'"></span></a></li>
			<li class="li-group" v-bind:class="[{active: department == 'FIR'}]"><a v-on:click="department='FIR'">FIRE <span class="glyphicon glyphicon-ok" v-show="department == 'FIR'"></span></a></li>
			<!--<li><a><button-group :value.sync="department" class="btn-group-vertical btn-group-block">
				<radio value='ALL'>ALL</radio>
				<radio value='POL'>POLICE</radio>
				<radio value='FIR'>FIRE</radio>
			</button-group></a></li>-->
		</dropdown>
		<dropdown :text="devITS ? 'Settings' : 'Style'">
			<li class="dropdown-header">Night Mode</li>
			<li class="li-group" v-bind:class="[{active: setNight == 'OFF'}]"><a v-on:click="setNight='OFF'">OFF <span class="glyphicon glyphicon-ok" v-show="setNight=='OFF'"></span></a></li>
			<li class="li-group" v-bind:class="[{active: setNight == 'AUTO'}]"><a v-on:click="setNight='AUTO'">AUTO <span class="glyphicon glyphicon-ok" v-show="setNight=='AUTO'"></span></a></li>
			<li class="li-group" v-bind:class="[{active: setNight == 'ON'}]"><a v-on:click="setNight='ON'">ON <span class="glyphicon glyphicon-ok" v-show="setNight=='ON'"></span></a></li>
			<li v-if="devITS" class="divider"></li>
			<li v-if="devITS" class="dropdown-header">Call Polling</li>
			<li v-if="devITS" class="li-group" v-bind:class="[{active: callsPollingSec == 5}]"><a v-on:click="callsPollingSec=5">5 sec <span class="glyphicon glyphicon-ok" v-show="callsPollingSec == 5"></span></a></li>
			<li v-if="devITS" class="li-group" v-bind:class="[{active: callsPollingSec == 10}]"><a v-on:click="callsPollingSec=10">10 sec <span class="glyphicon glyphicon-ok" v-show="callsPollingSec == 10"></span></a></li>
			<li v-if="devITS" class="li-group" v-bind:class="[{active: callsPollingSec == 'OFF'}]"><a v-on:click="callsPollingSec='OFF'">OFF <span class="glyphicon glyphicon-ok" v-show="callsPollingSec == 'OFF'"></span></a></li>
			<li v-if="devITS" class="divider"></li>
			<li v-if="devITS" class="dropdown-header">Vehicle Polling</li>
			<li v-if="devITS" class="li-group" v-bind:class="[{active: vehiclesPollingSec == 1}]"><a v-on:click="vehiclesPollingSec=1">1 sec <span class="glyphicon glyphicon-ok" v-show="vehiclesPollingSec == 1"></span></a></li>
			<li v-if="devITS" class="li-group" v-bind:class="[{active: vehiclesPollingSec == 5}]"><a v-on:click="vehiclesPollingSec=5">5 sec <span class="glyphicon glyphicon-ok" v-show="vehiclesPollingSec == 5"></span></a></li>
			<li v-if="devITS" class="li-group" v-bind:class="[{active: vehiclesPollingSec == 10}]"><a v-on:click="vehiclesPollingSec=10">10 sec <span class="glyphicon glyphicon-ok" v-show="vehiclesPollingSec == 10"></span></a></li>
			<li v-if="devITS" class="li-group" v-bind:class="[{active: vehiclesPollingSec == 'OFF'}]"><a v-on:click="vehiclesPollingSec='OFF'">OFF <span class="glyphicon glyphicon-ok" v-show="vehiclesPollingSec == 'OFF'"></span></a></li>
		</dropdown>
		
		<li v-show="showCloseAll"><a role="button" class="closeAll" v-on:click="clickCloseAll">Close All <span class="small glyphicon glyphicon-remove"></span></a></li>
		
		<dropdown class="hide-in-collapse">
			<button slot="button" type="button" class="btn btn-link navbar-btn dropdown-toggle" v-show="filterNotes_New.length > 0"><span class="badge">{{filterNotes_New.length}} <span class="caret"></span></span></button>
			<li v-for="call in filterCalls_NewNote"><a v-on:click="clickCallNotification(call)">{{call.complaint}} <span class="badge">{{filterNotesByCallNumber_New(call.callnumber).length}}</span></a></li>
		</dropdown>
		
		<dropdown class="hide-in-collapse stationNotification hidden-xs">
			<button slot="button" type="button" class="btn btn-link navbar-btn dropdown-toggle" v-show="filteredCalls_Station.length > 0"><span class="badge">{{station}} <span class="caret"></span></span></button>
			<li v-for="call in filteredCalls_Station"><a v-on:click="clickStationNotification(call)">{{call.complaint}} <span class="badge">{{call.stationUnits}}</span></a></li>
		</dropdown>
		
		<!--<li class="dropdown hide-in-collapse" v-show="filterNotes_New.length > 0">
			<a slot="button" class="dropdown-toggle"><span class="badge">{{filterNotes_New.length}} <span class="caret"></span></span></a>
			<ul slot="dropdown-menu" class="dropdown-menu">
				<li v-for="call in filterCalls_NewNote"><a v-on:click="clickCallNotification(call)">{{call.complaint}} <span class="badge">{{filterNotesByCallNumber_New(call.callnumber).length}}</span></a></li>
			</ul>
		</li>-->
		
		<!--<form class="navbar-form input-sm" slot="right"><bs-input type="text" placeholder="Street Address"></bs-input></form>-->
		
		<!--<form class="navbar-form navbar-right input-sm" slot="right">-->
		<div class="form-group form-group-sm hidden-xs" slot="right">
			<place-input v-on:click="resetAutocomplete" class="form-control input-sm" placeholder="Street Address" :select-first-on-enter="true" :component-restrictions.sync="placeInput.restrictions" :place.sync="placeInput.place" :types.sync="placeInput.types" v-ref:gplaceinput>
			</place-input>
		</div>
		<!--</form>-->
			
	</navbar>
	
	<alert :show.sync="showAlert" placement="top" duration="10000" type="warning" width="300px" dismissable>
		<p>Call {{alertCallNumber}} is no longer active</p>
	</alert>
	
	<alert :show="!(callsPolling) || !(vehiclesPolling) || !(notesPolling)" placement="top" type="danger" width="300px" dismissable>
		<p v-if="!(callsPolling)">Polling issues: Calls</p>
		<p v-if="!(notesPolling)">Polling issues: Notes</p>
		<p v-if="!(vehiclesPolling)">Polling issues: Vehicles</p>
	</alert>
	
	<alert :show="stationAlert > 0" placement="top" type="info" width="600px" duration="5000" dismissable>
		<p v-for="call in filteredCalls_Station">{{call.callnumber}} {{call.locationaddr}} {{call.stationUnits}}</p>
	</alert>
	
	<audio v-el:audio src="1squad51.mp3" preload="auto"></audio>
	
	<div class="row">
		<div class="col-xs-12" v-bind:class="[{'col-sm-12': !(showGIS || showVehicles), 'col-sm-9': (showGIS || showVehicles), 'col-md-10': (showGIS || showVehicles), 'landscape': isLandscape, 'narrative': showNarrative, 'fullLeft': displayToggle=='Map', 'fullRight': displayToggle=='List'}]">
			<div class="row">
				<div id="leftSide" class="col-md-7 col-lg-8" v-bind:class="[{
					'fullScreen': displayToggle=='Map', 'col-xs-6': isLandscape && displayToggle == 'Both'}]">
					<div id="mapDiv" v-show="displayToggle != 'List'">
						<map v-if="mapLoaded" :center.sync="centerV" :zoom.sync="zoomV" :bounds.sync="mapBounds" :options="mapOptions" v-on:g-idle="resizeMap" id="map" v-ref:map>
						
							<traffic-control></traffic-control>
							<!--<night-control></night-control>-->
							<center-control></center-control>
							
							<marker v-if="placeInput.place.id" :position.sync="placeInput.place.geometry.location" :clickable.sync="true" :draggable.sync="false" :icon="getSearchIcon()" :label="getSearchLabel()" :z-index="1600">
								<info-window :opened.sync="placeInputOpen" :z-index="1600">
									<span>
										{{placeInput.place.formatted_address}}
									</span>
								</info-window>
							</marker>
							
							<!-- accounts for up to 200 vehicles -->
							<marker v-for="vehicle in mappableVehicles" track-by="modemid" :position="getLatLng(vehicle.lat, vehicle.lng)" :clickable.sync="true" :draggable.sync="false" :icon="getVehicleIcon(vehicle)" :label="getVehicleLabel(vehicle)" @g-click="clickVehicleMarker(vehicle, $event)" :z-index="getVehicleIndex(vehicle)"> <!--:z-index="getVehicleIndex(vehicle)"-->
								<info-window class="iwStyle" :opened.sync="vehicle.isOpen" :z-index="getVehicleIndex(vehicle)">
									<b class="pull-left" style="margin-bottom:10px;">{{vehicle.label}}</b>
									<table class="table table-condensed">
										<tr v-if="vehicle.vin.length > 0">
											<td><small>Vehicle ID:</small></td><td title="TrackStar ID: {{vehicle.vehicleid}}"><small>{{vehicle.vin}}</small></td>
										</tr>
										<tr v-if="vehicle.unitid">
											<td><small>Officer:</small></td><td><small>{{vehicle.officername ? vehicle.officername : vehicle.officerids}}</small></td>
										</tr>
										<tr v-if="vehicle.division1">
											<td><small>Division:</small></td><td><small>{{vehicle.division1}}<span v-if="vehicle.division2"> - {{vehicle.division2}}</span></small></td>
										</tr>
										<tr v-if="vehicle.callcomplaint">
											<td><small>Complaint:</small></td><td><b><small>{{vehicle.callcomplaint.toUpperCase()}}&nbsp;<small>({{vehicle.tenstatus}})</small></span></small></b></td>
										</tr>
										<tr v-if="vehicle.callstreet">
											<td><small>Call Street:</small></td><td><small>{{vehicle.callstreet}}</small></td>
										</tr>
										<tr><td><small>Est Speed:</small></td><td><small>{{vehicle.velocity}}mph&nbsp;{{vehicle.compass}} {{getBearingArrow(vehicle.compass)}}</small></td></tr>
									</table>
									
								</info-window>
							</marker>
							
							<!--  accounts for up to 200 calls -->
							<marker v-for="call in mappableCalls" track-by="callnumber" :position="getLatLng(call.lat2, call.lng2)" :clickable.sync="true" :draggable.sync="false" :icon="getCallIcon(call.isOpen)" :label="getCallLabel(call.complaint, call.isnew)" @g-click="clickCallMarker(call, $event)" :z-index="getCallIndex(call)">
								<info-window :opened.sync="call.isOpen" :z-index="getCallIndex(call)" :content="call.complaint">
								</info-window>
							</marker>
							
							<!--<kml-layer url="https://sites.google.com/a/cityoflewisville.com/gis/files/CityLimits_Gray.kml"></kml-layer>-->
							<traffic-layer v-if="showTrafficLayer"></traffic-layer>
							<map-service-obj v-for="lyr in filterLayersByFiletype('mapservice')" :layer.sync="lyr"></map-service-obj>
							<tile-cache-obj v-for="lyr in filterLayersByFiletype('tilecache')" :layer.sync="lyr"></tile-cache-obj>
						</map>
					</div>
					<div id="narrativeFeed" v-if="showNarrative">
						<table class="table table-striped table-hover table-condensed small">
							<tbody>
								<tr v-for="note in filterNotes_Feed" v-on:click="clickNarrativeFeed(note.callnumber)" v-bind:class="[{'success': note.isnew}]">
									<td>{{note.complaint}}</td>
									<td><small>{{note.callnumber}}</small></td>
									<td>{{note.narrative}}</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div id="rightSide" class="col-md-5 col-lg-4" v-show="displayToggle != 'Map'" v-bind:class="[{
					'fullScreen': displayToggle=='List', 'col-xs-6': isLandscape && displayToggle == 'Both'}]">
					<div id="listDiv">
						<accordion id="list" v-ref:accordion>
							<panel v-for="call in sortedCalls" track-by="callnumber" :is-open.sync="call.isOpen" v-on:click="clickCallList(call, $event)" :type="call.isnew ? 'success' : 'default'" id="{{call.callnumber}}">
								<span slot="header">
									<span v-if="call.unitcount > 3" style="color:red;font-size: 0.9em;">*</span>
									<strong>{{call.complaint}}</strong><small>  P{{call.priority}}</small><small class="pull-right">{{call.timereceived.substr(0,5)}}</small>
									&nbsp;
									<!--<span class="label label-success" v-show="call.isnew">New</span>-->
									<span class="badge" v-show="filterNotesByCallNumber_New(call.callnumber).length > 0">{{filterNotesByCallNumber_New(call.callnumber).length}} New</span>
									<br>
									<small>{{call.locationaddr}}&nbsp;({{ (call.unitcount > 0 ? call.units : "No units") }})</small>
									<span class="badge small pull-right stationBadge" v-if="call.stationUnits.length > 0">{{station}}</span>
								</span>
								<span>
									<ul class="list-unstyled">
										<li>Call Number: {{call.callnumber}}</li>
										<li>Location: {{call.locationaddr}}</li>
										<li>Lat/Lng: {{call.lat ? call.lat : '???'}}, {{call.lng ? call.lng : '???'}}</li>
										<li>Time Received: {{call.timereceived}}</li>
										<li v-if="call.landmark">Landmark: {{call.landmark}}</li>
										<li>Department: {{call.department}}</li>
										<li>Priority: {{call.priority}}</li>
										<li v-if="filterVehiclesByCallUnits(call.units).length > 0">Map Units: <button type="button" v-for="unit in filterVehiclesByCallUnits(call.units)" class="btn btn-link btn-xs" v-on:click.stop="clickVehicleList(unit)">{{unit.label}}</button></li>
									</ul>
									<table class="table table-striped table-condensed table-bordered small">
										<tbody>
											<tr v-for="note in filterNotesByCallNumber(call.callnumber)" track-by="pkey" v-bind:class="[{'success': note.isnew}]">
												<td>{{note.narrative}}</td>
											</tr>
										</tbody>
									</table>
								</span>
							</panel>
						</accordion>
					</div>
				</div>
			</div>
		</div>
		<div v-show="showGIS || showVehicles" class='col-sm-3 col-md-2 hidden-xs' id="extraPanel">
			<div v-show="showGIS" id="layersList">
				<div v-show="chooseGIS == 'GISLayers'">
					<accordion>
						<panel v-for="group in groups" :header="group.name">
							<span>
								<table class="table table-condensed table-hover layersTable">
									<tbody>
										<tr v-for="lyr in filterLayersByGroup(group.id)">
											<td v-on:click="layerToggle(lyr)" colspan="{{lyr.legendshow.toLowerCase() == 'true' ? '1': '2'}}" class="layerCell">
												<small><span class="glyphicon" v-bind:class="[{'glyphicon-plus': !(lyr.active), 'glyphicon-ok': lyr.active}]"></span></small>
												{{lyr.label}}
												<span class="glyphicon glyphicon-refresh gly-spin" v-if="lyr.isloading"></span>
											</td>
											<td v-if="lyr.legendshow.toLowerCase() == 'true'" class="legendCell">
												<button class="btn btn-default btn-xs pull-right" v-if="lyr.active == true && (lyr.legend.length > 0)" v-on:click="chooseGIS = lyr.label"><span class="glyphicon glyphicon-menu-hamburger"></span></button>
											</td>
										</tr>
									</tbody>
								</table>
							</span>
						</panel>
					</accordion>
					<button class="btn btn-xs btn-danger pull-right reloadGISButton" v-on:click="loadGISLayers()">Reload GIS Layers</button>
				</div>
				<div v-show="chooseGIS != 'GISLayers'">
					<div v-for="lyr in filterLayers_Legend" v-show="chooseGIS == lyr.label">
						<h4 class="legendTitle"><button class="btn btn-xs btn-default" v-on:click="chooseGIS = 'GISLayers'"><span class="glyphicon glyphicon-remove"></span></button>{{lyr.label}} <small>LEGEND</small></h4>
						<table class="table">
							<thead>
								<tr>
									<th>Symbol</th>
									<th>Value</th>
								</tr>
							</thead>
							<tbody>
								<tr v-for="item in lyr.legend">
									<td><img v-bind:src="'data:' + item.contentType + ';base64,' + item.imageData" v-bind:height="item.height" v-bind:width="item.width"/></td>
									<td>{{item.label}}</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div v-show="showVehicles" id="vehicleList">
				<accordion>
					<panel header="Police">
						<span>
							<a class="list-group-item" v-for="vehicle in filterVehicles_Police" v-on:click="clickVehicleList(vehicle, $event)">
								<h5 class="list-group-item-heading"><strong>{{vehicle.vin}}</strong>  <span v-if="!(vehicle.isrecent)" class="glyphicon glyphicon-time"></span></h5>
								
									<ul class="list-group-item-text list-unstyled" v-if="vehicle.isOpen">
										<li v-if="vehicle.unitid">Unit ID: {{vehicle.unitid}}</li>
										<li v-if="vehicle.division1">Division: {{vehicle.division1}}<span v-if="vehicle.division2"> - {{vehicle.division2}}</span></li>
										<li v-if="vehicle.unitid">Officer: {{vehicle.officername ? vehicle.officername : vehicle.officerids}}</li>
										<li v-if="vehicle.callnumber">Call Number: {{vehicle.callnumber}}</li>
										<li v-if="vehicle.callnumber">Complaint: {{vehicle.callcomplaint}}</li>
										<li v-if="!(vehicle.isrecent)">Last Ping: {{vehicle.latlngtime}}</li>
										<li>TrackStar ID: {{vehicle.vehicleid}}</li>
									</ul>
							</a>
						</span>
					</panel>
					<panel header="Fire">
						<span>
							<a class="list-group-item" v-for="vehicle in filterVehicles_Fire" v-on:click="clickVehicleList(vehicle, $event)">
								<h5 class="list-group-item-heading"><strong>{{vehicle.label}}</strong>  <span v-if="!(vehicle.isrecent)" class="glyphicon glyphicon-time"></span></h5>
								
									<ul class="list-group-item-text list-unstyled" v-if="vehicle.isOpen">
										<li v-if="vehicle.unitid">Unit ID: {{vehicle.unitid}}</li>
										<li v-if="vehicle.division1">Division: {{vehicle.division1}}<span v-if="vehicle.division2"> - {{vehicle.division2}}</span></li>
										<li v-if="vehicle.unitid">Officer: {{vehicle.officername ? vehicle.officername : vehicle.officerids}}</li>
										<li v-if="vehicle.callnumber">Call Number: {{vehicle.callnumber}}</li>
										<li v-if="vehicle.callnumber">Complaint: {{vehicle.callcomplaint}}</li>
										<li v-if="!(vehicle.isrecent)">Last Ping: {{vehicle.latlngtime}}</li>
										<li>TrackStar ID: {{vehicle.vehicleid}}</li>
									</ul>
							</a>
						</span>
					</panel>
					<panel header="Fire Prevention">
						<span>
							<a class="list-group-item" v-for="vehicle in filterVehicles_FirePrevention" v-on:click="clickVehicleList(vehicle, $event)">
								<h5 class="list-group-item-heading"><strong>{{vehicle.label}}</strong>  <span v-if="!(vehicle.isrecent)" class="glyphicon glyphicon-time"></span></h5>							
									<ul class="list-group-item-text list-unstyled" v-if="vehicle.isOpen">
										<li>Radio ID: {{vehicle.vin}}</li>
										<li v-if="!(vehicle.isrecent)">Last Ping: {{vehicle.latlngtime}}</li>
										<li>TrackStar ID: {{vehicle.vehicleid}}</li>
									</ul>
								
							</a>
						</span>
					</panel>
				</accordion>
			</div>
		</div>
	</div>
</div>

<form id="form1" runat="server"></form>

<script>

window.load = function(e){
	document.getElementById("form1").action += hashstring;
}

VueGoogleMap.load({
	key: 'AIzaSyDARduaVDhGG5z3_D54raucZWFABj2PFvE',
	v: '3',
	libraries: 'places,drawing',
});

Vue.component('navbar', VueStrap.navbar);
Vue.component('accordion', VueStrap.accordion);
Vue.component('panel', VueStrap.panel);
Vue.component('radio', VueStrap.radio);
Vue.component('button-group', VueStrap.buttonGroup);
Vue.component('dropdown', VueStrap.dropdown);
Vue.component('checkbox', VueStrap.checkbox);
Vue.component('alert', VueStrap.alert);
Vue.component('bsinput', VueStrap.input);

Vue.component('map', VueGoogleMap.Map);
Vue.component('marker', VueGoogleMap.Marker);
Vue.component('cluster', VueGoogleMap.Cluster);
Vue.component('info-window', VueGoogleMap.InfoWindow);
Vue.component('place-input', VueGoogleMap.PlaceInput);

	
var app = new Vue({
	el: '#app',
	data: {
		callsPolling: true,
		callsPollingSec: 10,
		notesPolling: true,
		vehiclesPolling: true,
		vehiclesPollingSec: 5,
		data: {Calls: [], Notes: []},
		data2: {Vehicles:[]},
		layers: [],
		countActiveLayers: 0,	// what what this going to be used for?
		
		datenow: '',
		
		/* map variables */
		centerV: {lat: 33.04874516100256, lng: -96.9571323598633},
		zoomV: 13,
		mapBounds: {},	// is this anything
		centerDefault: {lat: 33.04874516100256, lng: -96.9571323598633},
		
		countOpenIndex: 1600, 
		
		/* views */
		radioValue: 'Both',
		// GIS layers
		showGIS: false,
		chooseGIS: 'GISLayers',
		showVehicles: false,
		/* options */
		showTrafficLayer: false,
		setNight: 'OFF',
		nightMode: false,
		/* filters */
		department: 'ALL',
		showNarrative: false,
		showP9: true,
		station: '',
		
		devITS: false,
		
		filteredCalls_Station: [],
		stationAlert: false,
		
		// initial load for Call Number as parameter
		alertCallNumber: '',
		showAlert: false,
		
		// input
		placeInputOpen: false,
		placeInput: {place:{name:''}, types: [], restrictions: {'country':'us'}},
		
		fullHeight: document.documentElement.clientHeight,
		fullWidth: document.documentElement.clientWidth,
		isMobile: false,
		
		/* TRYING TO FIX CENTERING ISSUE */
		mapLoaded: false,
		centerSW: {lat: 32.98505, lng: -97.04425},
		centerNE: {lat: 33.10089, lng: -96.86555},
		
			
		/*mapstyle*/
		night: [
			{elementType: 'geometry', stylers: [{color: '#000000'}]},
			{elementType: 'labels.text.stroke', stylers: [{color: '#242f3e'}]},
			{elementType: 'labels.text.fill', stylers: [{color: '#746855'}]},
			{featureType: 'administrative.locality', elementType: 'labels.text.fill', stylers: [{color: '#d59563'}]},
			{featureType: 'poi', elementType: 'labels.text.fill', stylers: [{color: '#d59563'}]},
			{featureType: 'poi.park', elementType: 'geometry', stylers: [{color: '#1a331a'}]},
			{featureType: 'poi.park', elementType: 'labels.text.fill', stylers: [{color: '#3c763d'}]},
			{featureType: 'poi.park', elementType: 'labels.text.stroke', stylers: [{visibility: 'off'}]},
			{featureType: 'road', elementType: 'geometry', stylers: [{color: '#38414e'}]},
			{featureType: 'road', elementType: 'geometry.stroke', stylers: [{color: '#212a37'}]},
			{featureType: 'road', elementType: 'labels.text.fill', stylers: [{color: '#9ca5b3'}]},
			{featureType: 'road.highway', elementType: 'geometry', stylers: [{color: '#746855'}]},
			{featureType: 'road.highway', elementType: 'geometry.stroke', stylers: [{color: '#1f2835'}]},
			{featureType: 'road.highway', elementType: 'labels.text.fill', stylers: [{color: '#f3d19c'}]},
			{featureType: 'transit', elementType: 'geometry', stylers: [{color: '#2f3948'}]},
			{featureType: 'transit.station', elementType: 'labels.text.fill', stylers: [{color: '#d59563'}]},
			{featureType: 'water', elementType: 'geometry', stylers: [{color: '#0d1d26'}]},
			{featureType: 'water', elementType: 'labels.text.fill', stylers: [{color: '#31708f'}]},
			{featureType: 'water', elementType: 'labels.text.stroke', stylers: [{visibility: 'off'}]}
		],
	},
	watch:{
		showTrafficLayer: function(newVal, oldVal){
			if (newVal != oldVal){
				if(newVal){
					$("#traffic").addClass("controlBold");
				}
				else{
					$("#traffic").removeClass("controlBold");
				}
			}
		},
		setNight: function(newVal, oldVal){
			if (newVal != oldVal){
				if (newVal == 'OFF'){
					this.nightMode = false;
				}
				else if (newVal == 'ON'){
					this.nightMode = true;
				}
				else if (newVal == 'AUTO'){
					this.setDate();
				}
			}
		},
		/*nightMode: function(newVal, oldVal){
			if (newVal != oldVal){
				if(newVal){
					$("#night").addClass("controlBold");
				}
				else{
					$("#night").removeClass("controlBold");
				}
			}
		},*/
		'placeInput.place': function(newVal, oldVal){
			//console.log("PLACECHANGE");
			if (newVal.name != oldVal.name){
				if(newVal.name){
					if (this.zoomV < 15){
						this.zoomV = 15;
					}
					this.centerV = newVal.geometry.location;
					this.placeInputOpen = true;
				}
			}
		},
		
		filteredCalls_Station: {
			handler: function(newArr, oldArr){
				var playAlert = false;
				var matchC;
				var matchU;
				var newU;
				
				if(newArr.length > 0){
					console.log("filteredCalls_Station Change");
					// if number of calls with units for set station is larger than before, play alert
					if(newArr.length > oldArr.length){
						playAlert = true;
					}
					// else, compare calls exactly
					else{
						// for each call in new array
						newArr.forEach(function(callN){
							// if new call OR new units have not been found
							if (!(playAlert)){
								// find matching call in old array
								matchC = oldArr.findIndex(function(callO){
									match = false	// default not a match
									// if call numbers match, no new call, check units
									if(callN.callnumber == callO.callnumber){
										// if number of units is <= number of units previously, compare unit numbers
										if (callN.stationUnits.length <= callO.stationUnits.length){
											newU = false;
											// for each unit in new call array
											callN.stationUnits.forEach(function(unitN){
												if(!(newU)){
													matchU = callO.stationUnits.findIndex(function(unitO){
														return unitN == unitO;
													});
													if(matchU == -1){
														newU = true;
													}
												}
											});
											if(!(newU)){
												match = true;
											}
										}
										// else, new unit has been found, match already false
									}
									// else new call has been found, match already false
									return match;
								});
								// if not exact match, play Alert
								if(matchC == -1){
									playAlert = true;
								}
							}
						});
					}
				}
				if (playAlert){
					console.log("alert");
					this.stationAlert = true;
					this.$els.audio.play();
				}
				else{
					this.stationAlert = false;
				}
			},
			deep: true
		},
	},
	computed: {
		currentRoute: function(){
			var route = '';

			// Views
			
			if(this.radioValue != 'Both'){
				route += 'view=' + this.radioValue.toLowerCase();
			}
			if(this.showNarrative){
				if(this.radioValue != 'Both'){
					route += '&';
				}
				route += 'narrative';
			}
			if(this.showGIS){
				if( this.radioValue != 'Both' || this.showNarrative){
					route += '&';
				}
				route += 'layers';
			}
			if(this.showVehicles){
				if( this.radioValue != 'Both' || this.showNarrative || this.showGIS ){
					route += '&';
				}
				route += 'vehicles';
			}
			
			// Options
			
			if(this.showTrafficLayer){
				if( this.radioValue != 'Both' || this.showNarrative || this.showGIS || this.showVehicles ){
					route += '&';
				}
				route += 'traffic';
			}
		
			// Filters
			
			if(this.department != 'ALL'){
				if( this.radioValue != 'Both' || this.showNarrative || this.showGIS || this.showVehicles || this.showTrafficLayer ){
					route += '&';
				}
				
				if(this.department == 'POL'){
					route += 'department=police';
				}
				else{
					route += 'department=fire';
				}
			}
			if(!(this.showP9)){
				if( this.radioValue != 'Both' || this.showNarrative || this.showGIS || this.showVehicles || this.showTrafficLayer || this.department != 'ALL' ){
					route += '&';
				}
				route += 'xp9';
			}
			if(this.station != ''){
				if( this.radioValue != 'Both' || this.showNarrative || this.showGIS || this.showVehicles || this.showTrafficLayer || this.department != 'ALL' || !(this.showP9) ){
					route += '&';
				}
				
				route += 'station=' + this.station.toLowerCase();
			}
			
			if(this.setNight != 'OFF'){
				if( this.radioValue != 'Both' || this.showNarrative || this.showGIS || this.showVehicles || this.showTrafficLayer || this.department != 'ALL' || !(this.showP9) || this.station != '' ){
					route += '&';
				}
				route += 'night=' + this.setNight.toLowerCase();
			}
			
			if(this.devITS){
				if( this.radioValue != 'Both' || this.showNarrative || this.showGIS || this.showVehicles || this.showTrafficLayer || this.department != 'ALL' || !(this.showP9) || this.station != '' || this.setNight != 'OFF' ){
					route += '&';
				}
				route += 'developer';
			}
			/*
			if(this.callsPollingSec != 10){
				if( this.radioValue != 'Both' || this.showNarrative || this.showGIS || this.showVehicles || this.showTrafficLayer || this.department != 'ALL' || !(this.showP9) || this.station != '' || this.setNight != 'OFF' || this.devITS ){
					route += '&';
				}
				if(this.callsPollingSec == 'OFF'){
					route += 'callpoll=' + this.callsPollingSec.toLowerCase();
				}
				else {
					route += 'callpoll=' + this.callsPollingSec;
				}
			}
			if(this.vehiclesPollingSec != 5){
				if( this.radioValue != 'Both' || this.showNarrative || this.showGIS || this.showVehicles || this.showTrafficLayer || this.department != 'ALL' || !(this.showP9) || this.station != '' || this.setNight != 'OFF' || this.devITS || this.callsPollingSec != 10 ){
					route += '&';
				}
				if(this.vehiclesPollingSec == 'OFF'){
					route += 'vehiclepoll=' + this.vehiclesPollingSec.toLowerCase();
				}
				else {
					route += 'vehiclepoll=' + this.vehiclesPollingSec;
				}
			}
			*/
			
			return route;
		},
	
		isLandscape: function(){
			return (this.fullWidth > this.fullHeight);
		},
		isStacked: function(){
			return (this.fullWidth <= 991 );
		},
		
		displayToggle: function(){
			if(this.isStacked){
				return this.radioValue;
			}
			else{
				return 'Both';
			}
		},
		
		mapOptions: function(){
			if(!(this.nightMode)){
				return{fullscreenControl: false, streetViewControl: true, styles: null};
			}
			else{
				return{fullscreenControl: false, streetViewControl:true, styles: this.night};
			}
		},
		
		callsPollingMS: function(){
			if (this.callsPollingSec == 'OFF'){
				return 'OFF';
			}
			else{
				return this.callsPollingSec * 1000;
			}
		},
		
		vehiclesPollingMS: function(){
			if (this.vehiclesPollingSec == 'OFF'){
				return 'OFF';
			}
			else{
				return this.vehiclesPollingSec * 1000;
			}
		},
		
		filteredCalls: function(){
			var self = this;
			
			// Filter Priority 9
			var c; 
			if(this.showP9){
				c = this.data.Calls;
			}
			else{
				c = this.data.Calls.filter(function(call){
					return call.priority != 9;
				});
			}
			
			// Filter Department
			if (this.department == 'ALL'){
				return c;
			}
			else{
				return c.filter(function(call){
					return call.department == self.department;
				});
			}
		},
		filteredNotes: function(){
			var self = this;
			
			// Filter Priority 9
			var n; 
			if(this.showP9){
				n = this.data.Notes;
			}
			else{
				n = this.data.Notes.filter(function(note){
					return note.priority != 9;
				});
			}
			
			// Filter Department
			if (this.department == 'ALL'){
				return n;
			}
			else{
				return n.filter(function(note){
					return note.department == self.department;
				});
			}
		},
		filteredVehicles: function(){
			var self = this;
			if (this.department == 'ALL'){
				return this.data2.Vehicles;
			}
			else{
				return this.data2.Vehicles.filter(function(vehicle){
					return vehicle.department == self.department;
				});
			}
		},
		sortedCalls: function(){
			return this.filteredCalls.sort(function(a, b){
				return a.order - b.order;
			});
		},
		mappableCalls: function(){
			return this.filteredCalls.filter(function (call) {
				return !(!(call.lat) || !(call.lng));
			});
		},
		mappableVehicles: function(){
			return this.filteredVehicles.filter(function (vehicle) {
				return !(!(vehicle.lat) || !(vehicle.lng));
			});
		},
		showCloseAll: function(){
			// determine if more than 1 call open, show/hide close all button
			var c = this.filteredCalls.filter(function(call){
				return call.isOpen;
			});
			var v = this.filteredVehicles.filter(function(vehicle){
				return vehicle.isOpen;
			});
			if(c && v){
				return ((c.length + v.length) > 1);
			}
			else if(c){
				return (c.length > 1);
			}
			else if(v){
				return (v.length > 1);
			}
			else{
				return false;
			}
		},
		filterVehicles_Police: function(){
			return this.data2.Vehicles.filter(function(vehicle){
				return vehicle.department == 'POL';
			}).sort(function(a,b){
				if(a.vin == b.vin){
					return a.label - b.label;
				}
				return a.vin - b.vin;
			});
		},
		filterVehicles_Fire: function(){
			return this.data2.Vehicles.filter(function(vehicle){
				return vehicle.department == 'FIR' && vehicle.division1 != 'PREVENTION';
			}).sort(function(a,b){
				return a.vin - b.vin;
			});
		},
		filterVehicles_FirePrevention: function(){
			return this.data2.Vehicles.filter(function(vehicle){
				return vehicle.department == 'FIR' && vehicle.division1 == 'PREVENTION';
			}).sort(function(a,b){
				return a.label - b.label;
			});
		},
		filterCalls_NewNote: function(){
			return this.filteredCalls.filter(function(call){
				return call.isnew;
			});
		},
		/*filterCalls_Station: function(){
			var self = this;
			return this.sortedCalls.filter(function(call){
				return (call.unitcount > 0 && call.stationUnits.length > 0);
			});
		},*/
		filterNotes_New: function(){
			return this.filteredNotes.filter(function(note){
				return note.isnew; 
			});
		},
		filterNotes_Feed: function(){
			var notesNew = [];
			var notesExtra = [];
			notesNew = this.filteredNotes.filter(function(note){
				return note.isnew2; 
			});
			if(notesNew.length < 10){
				notesExtra = this.filteredNotes.filter(function(note){
					return !(note.isnew2); 
				}).sort(function(a, b){
					return a.order - b.order;
				}).slice(0, (10 - notesNew.length) );
			}
			return notesNew.concat(notesExtra).sort(function(a,b){
				return a.order - b.order;
			});
		},
		filterLayers_Legend: function(){
			return this.layers.filter(function(lyr){
				return (lyr.filetype.toLowerCase() == 'mapservice' && lyr.active == true && lyr.legendshow.toLowerCase() == "true" && (lyr.legend.length > 0) );
			}).sort(function(a, b){
				return a.toggleOrder - b.toggleOrder;
			});
		},
		groups: function() {
			g = this.layers.map(function(obj) { 
				return {
					id: obj.groupid, 
					name: obj.groupname, 
					order: obj.grouporder
				};
			});
			
			newArr = [];
			origLen = g.length;
			found = false;
			x = 0;
			y = 0;

			for (x = 0; x < origLen; x++) {
				found = false;
				for (y = 0; y < newArr.length; y++) {
					if (g[x].id === newArr[y].id) {
						found = true;
						break;
					}
				}
				if (!found) {
					newArr.push(g[x]);
				}
			}
			return newArr.sort(function(a, b){ return a.order - b.order});
		}
	},
	methods:{
		handleResize: function(event) {
			this.fullHeight = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;
			this.fullWidth = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
		},
		resizeMap: function(){
			this.$broadcast('g-resize-map');
		},
		
		setDate: function(){
			var self = this;
			
			if(self.setNight == 'AUTO'){
				self.datenow = moment();
				
				//console.log(self.datenow);
				
				if (self.datenow.second() > 0){
					setTimeout(self.setDate, 1000);
				}
				else{
					setTimeout(self.setDate, 60000);
				}
				/*else{
					setTimeout(self.setDate, 3600000);
				}*/
				
				if(self.datenow.hour() > 19 || self.datenow.hour() < 8){
					self.nightMode = true;
				}
				else{
					self.nightMode = false;
				}
			}
		},
		
		filterVehiclesByCallUnits: function(units){
			var u = units.split(', ');
			return this.mappableVehicles.filter(function(vehicle){
				return (u.indexOf(vehicle.label) > -1);
			});
		},

		filterNotesByCallNumber: function(callnumber){
			return this.filteredNotes.filter(function(note){
				return note.callnumber == callnumber;
			}).sort(function(a,b){
				return b.order - a.order;
			});
		},
		filterNotesByCallNumber_New: function(callnumber){
			return this.filteredNotes.filter(function(note){
				return note.callnumber == callnumber && note.isnew; 
			});
		},
		
		filterLayersByFiletype: function(type){
			return this.layers.filter(function(lyr){
				return lyr.filetype.toLowerCase() == type && lyr.active == true;
			});
		},
		filterLayersByGroup: function(group){
			return this.layers.filter(function(lyr){
				return lyr.groupid === group;
			}).sort(function(a, b){
				return a.grouporderinside - b.grouporderinside;
			});
		},
		
		/*callHasRecent:function(call){
			if(call.latestM != ''){
				if (this.datenow.diff(call.latestM, 'seconds') <= 120){
					return true;
				}
			}
			return false;
		},*/
		
		getLatLng: function(clat, clng){
			return {lat: clat, lng: clng};
		},
		
		getBearingArrow: function(_bearing){
			var _arrow = '↑↑'; //'←'  '→'  '↓  ↖  ↗  ↘  ↙'
			if ( ['N'].indexOf(_bearing) > -1 ){_arrow = '↑↑'}
			if ( ['NNE','NE','ENE'].indexOf(_bearing) > -1 ){_arrow = '↓↗'}
			if ( ['E'].indexOf(_bearing) > -1 ){_arrow = '→→'}
			if ( ['ESE','SE','SSE'].indexOf(_bearing) > -1 ){_arrow = '↓↘'}
			if ( ['S'].indexOf(_bearing) > -1 ){_arrow = '↓↓'}
			if ( ['SSW','SW','WSW'].indexOf(_bearing) > -1 ){_arrow = '↓↙'}
			if ( ['W'].indexOf(_bearing) > -1 ){_arrow = '←←'}
			if ( ['WNW','NW','NNW'].indexOf(_bearing) > -1 ){_arrow = '↓↖'}
			return _arrow.substr(1,1);
		},
		
		/* MAP ICONS & LABELS */
		getVehicleIcon: function(vehicle){
			if (!(vehicle.isrecent)){
				if(!(vehicle.isOpen)){
					return {url: 'vehicles/white1_v1.png', labelOrigin: new google.maps.Point(27,9)};
				}
				else{
					return {url: 'vehicles/gray1_ghost_v1.png', labelOrigin: new google.maps.Point(26,9)};
				}
			}
			else{
				if(vehicle.department == 'POL'){
					if (vehicle.callnumber.length > 5){
						return {url: 'vehicles/blue1_v1_OnACall.png', labelOrigin: new google.maps.Point(26,11)};
					}
					else{
						return {url: 'vehicles/blue1_v1.png', labelOrigin: new google.maps.Point(26,9)};
					}
				}
				else if(vehicle.department == 'FIR'){
					if(vehicle.division1 == 'PREVENTION'){
						return {url: 'vehicles/purple1_v1.png', labelOrigin: new google.maps.Point(26,9)};
					}
					else if (vehicle.callnumber.length > 5){
						return {url: 'vehicles/red1_v1_OnACall.png', labelOrigin: new google.maps.Point(26,11)};
					}
					else{
						return {url: 'vehicles/red1_v1.png', labelOrigin: new google.maps.Point(26,9)};
					}
				}
				else if(vehicle.department == 'ALL'){
					return {url: 'vehicles/dotGreen.png'};
				}
			}
		},
		getVehicleLabel: function(vehicle){
			var vcolor = 'white';
			var vweight = '500';
			/*if (!(this.nightMode) && !(isrecent)){
				return {
					text: label,
					color: 'black'
				};
			}*/
			if (this.nightMode && !(vehicle.isrecent) && !(vehicle.isOpen)){
				vcolor = '#cccccc';
			}
			else if (!(vehicle.isrecent)){
				vcolor = 'black';
			}
			if (vehicle.department == 'POL' && !(vehicle.onduty)){
				vweight = '300';
			}
			return {
				text: vehicle.label,
				color: vcolor,
				font: 'Roboto, Arial, sans-serif',
				fontSize: '14px',
				fontWeight: vweight
			};
		},
		getVehicleIndex: function(vehicle){
			var group = 200;
			
			if(vehicle.isOpen){
				return vehicle.openIndex;
			}
			else{
				if (vehicle.isrecent){
					if(vehicle.velocity != 0){
						if(vehicle.callnumber != '' ){
							group = 1600;
						}
						else{
							if(vehicle.division1 != 'PREVENTION'){
								group = 1400;
							}
							else{
								group = 1200;
							}
						}
					}
					else{
						if(vehicle.callnumber != '' ){
							group = 1000;
						}
						else{
							if(vehicle.division1 != 'PREVENTION'){
								group = 800;
							}
							else{
								group = 600;
							}
						}
					}
				}
				return group - vehicle.order;
			}
		},
		getCallIndex: function(call){
			if(call.isOpen){
				return call.openIndex;
			}
			else{
				return 400 - call.order;
			}
		},
		getCallIcon: function(isOpen) {
			var url = 'vehicles/call_v1.png';
			/*if(isOpen){
				url = 'vehicles/call_v1_green.png';
			}*/
			return {
				url: url,
				labelOrigin: new google.maps.Point(25, 5)
			};
		},
		getCallLabel: function(complaint, isnew){
			var vcolor = 'black';
			/*if(this.nightMode && isnew){
				vcolor = '#dff0d8';
			}*/
			if(this.nightMode){
				vcolor = '#cccccc';
			}
			/*else if(isnew){
				vcolor = '#3c763d';
			}*/
			
			return {
				text: complaint,
				fontFamily: 'Roboto, Arial, sans-serif',
				fontSize: '12px',
				fontWeight: '700',
				color: vcolor
			};
		},
		getSearchIcon: function() {
			return {
				url: this.placeInput.place.icon,
				scaledSize: new google.maps.Size(30,30),
				labelOrigin: new google.maps.Point(15, 35)
			};
		},
		getSearchLabel: function(){
			var vcolor = 'black';
			if(this.nightMode){
				vcolor = '#cccccc';
			}
			return {
				text: this.placeInput.place.name,
				fontFamily: 'Roboto, Arial, sans-serif',
				fontSize: '12px',
				fontWeight: '700',
				color: vcolor
			};
		},
		
		// Copied from Jason's
		// Brandon suggests to change this to show "X min Y sec" instead of "X.Z min"
		/*elapsedSeconds: function(seconds){
            var minutes = (seconds/60);
            var hours = (minutes/60);
            var days = (hours/24);
            var value = '';

            if (seconds <= 60){value = seconds.toFixed(0) + ' secs';}
            if (seconds > 60 && minutes <= 59 ){value = minutes.toFixed(1) + ' mins'}
            if (minutes >=60 && hours <= 23){value = hours.toFixed(1) + ' hrs'}
            if (hours >= 24){value = days.toFixed(1) + ' days'}
            return value;
        },*/
		
		/* EVENTS - CLICK */
		clickCenterMap: function(){
			this.centerV = this.centerDefault;
			this.zoomV = 13;
			
			return false;
		},
		clickCloseAll: function(){
			this.data.Calls.forEach(function(call){
				call.isOpen = false;
			});
			this.data2.Vehicles.forEach(function(vehicle){
				vehicle.isOpen = false;
			});
			
			this.countOpenIndex = 1600;
			
			return;
		},
		clickCallMarker: function(call, e){
			var self = this;
			
			if(!(call.isOpen)){
				call.openIndex = self.countOpenIndex + 1;
				self.countOpenIndex++;
				Vue.nextTick(function(){
					self.scrollToCallPanel(call);
				});
			}
			
			return;
		},
		clickCallList: function(call, e){
			var self = this;
			
			Vue.nextTick(function(){
				if(call.isOpen){
					call.openIndex = self.countOpenIndex + 1;
					self.countOpenIndex++;
					self.centerCallMarker(call);
				}
			});
			
			return;
		},
		clickCallNotification: function(call, e){
			var self = this;
			
			if(!(call.isOpen)){
				call.isOpen = true;
			}
			Vue.nextTick(function(){
				if(call.isOpen){
					call.openIndex = self.countOpenIndex + 1;
					self.countOpenIndex++;
				}
				self.scrollToCallPanel(call);
			});
			self.centerCallMarker(call);
			
			return;
		},
		clickStationNotification: function(callS, e){
		var c = this.filteredCalls.find(function(call){
				return call.callnumber == callS.callnumber;
			});
			
			if(c){
				this.clickCallNotification(c);
			}
			
			return;
		},
		clickNarrativeFeed: function(callnumber){
			var c = this.filteredCalls.find(function(call){
				return call.callnumber == callnumber;
			});
			
			if(c){
				this.clickCallNotification(c);
			}
			
			return;
		},
		clickVehicleMarker: function(vehicle, e){
			var self = this;
			
			if(!(vehicle.isOpen)){
				vehicle.openIndex = self.countOpenIndex + 1;
				self.countOpenIndex++;
			}
			
			return;
		},
		clickVehicleList: function(vehicle, e){
			var self = this;
			
			if(!(vehicle.isOpen)){

				vehicle.isOpen = true;
			}
			Vue.nextTick(function(){
				if(vehicle.isOpen){
					vehicle.openIndex = self.countOpenIndex + 1;
					self.countOpenIndex++;
				}
			});
			this.centerVehicleMarker(vehicle);
			
			return;
		},
		/* FUNCTIONAL */
		goToCallnumber: function(callnumber){
			var c = this.filteredCalls.find(function(call){
				return call.callnumber == callnumber;
			});
			
			if(c){
				this.clickCallNotification(c);
			}
			else{
				//alert("Call " + callnumber + " is no longer active");
				this.alertCallNumber = callnumber;
				this.showAlert = true;
			}
			return;
		},
		scrollToCallPanel: function(call){		
			// scroll to panel
			var p = app.$refs.accordion.$children.find(function (panel){
				return panel.$el.id == call.callnumber;
			});
			app.$el.querySelector("#rightSide").scrollTop = p.$el.offsetTop;
			
			return;
		},
		centerCallMarker: function(call){
			// center & zoom to call marker on map
			if( !(!(call.lat) || !(call.lng)) ){
				if (this.zoomV < 15){
					this.zoomV = 15;
				}
				this.centerV = this.getLatLng(call.lat2, call.lng2);
			}
			return;
		},
		centerVehicleMarker: function(vehicle){
			// center & zoom to vehicle marker on map
			if( !(!(vehicle.lat) || !(vehicle.lng)) ){
				if (this.zoomV < 15){
					this.zoomV = 15;
				}
				this.centerV = this.getLatLng(vehicle.lat, vehicle.lng);
			}
			return;
		},
		
		resetAutocomplete: function(){
			var self = this;
			if(this.placeInput.place.id){
				this.placeInputOpen = false;
				this.placeInput.place = {name:''};
				Vue.nextTick(function(){
					self.$refs.gplaceinput.$els.input.value = self.placeInput.place.name;
				});
			}
			return;
		},
		
		layerToggle: function(lyr){
			// DECLARE VARIABLES
			var self = this;
			
			if(lyr.active === false){
				//lyr.isloading = true;
				self.countActiveLayers++;
				lyr.toggleOrder = self.countActiveLayers;
				
				if(lyr.filetype.toLowerCase() == "mapservice"){
					lyr.active = true;
				}
				if(lyr.filetype.toLowerCase() == "tilecache"){
					lyr.active = true;
				}
				
			}
			else{
				lyr.active = false;
				self.countActiveLayers--;
				lyr.toggleOrder = 0;
			}
			return;
		},
		
		loadGISLayers: function(){
			var self = this;
			this.$http.get("https://spreadsheets.google.com/feeds/list/1q2t8kR4fme1D0Us2EZmsj3LjBQ2QxD0lfl2db68hF2Q/1/public/values?&alt=json&sq=label%3E%22%22%20and%20id%3C%3E%22ID%22").then(
			function(response) {
				//Success Callback
				
				self.layers = response.body.feed.entry.map(function(obj, i){
					lyr = {};
					Object.keys(obj).forEach(function(x){
						if(x.substr(0,4)=='gsx$' || x=='updated'){
							if(x == 'gsx$infowindowcolumns'){
								lyr[x.replace('gsx$','')] = obj[x].$t.split(",").map(function(obj){return obj.toLowerCase()});
							}
							else{
								lyr[x.replace('gsx$','')] = obj[x].$t;
							}
						}
					});
					
					// Set other properties for each layer object
					lyr.isloading = false;
					lyr.toggleOrder = parseInt(9 + lyr.id);
					lyr.mapservice = {};
					lyr.legend = [];
					
					// Activate layers if open on load is true
					if(lyr.avlopenonload.toLowerCase() == "true"){
						lyr.active = true;
					}
					else{
						lyr.active = false;
					}
					
					return lyr;
				});
				
				//console.log(self.layers);
				
			}, function (response) {
				// error callback
				alert("Error loading GIS Layers - no response from spreadsheet");
			});
		},
		pollingCalls: function(){
			var self = this;
			this.$http.jsonp('http://eservices.cityoflewisville.com/citydata/', {method: 'POST', params: {
				datasetid: 'AVL3_PollingCalls',
				oauthtoken: OAUTH.access_token,
				datasetformat: 'jsonp',
				callback: 'data'
			}}).then(
			function(response){
				//console.log(response.data.results);
				//console.log(response.data.Notes);
				
				var unitArr;
				var u;
				var checkStation = false;
				
				response.data.results.forEach(function(call, index){
					unitArr = '';
					var i = app.data.Calls.findIndex(function (c){
						return c.callnumber == call.callnumber;
					});
					if (i == -1){
						// new call
						call['isOpen'] = false;
						call['openIndex'] = 0;
						if(app.station){
							if(call.unitcount > 0){
								u = call.units.split(',');
								unitArr = u.filter(function(unit){
									return(unit.match("(E|T|M).*") && unit.endsWith(app.station.slice(-1)) );
								});
							}
						}
						call['stationUnits'] = unitArr;
						if(unitArr.length > 0){
							checkStation = true;
						}
					}
					else{
						// old call, copy over prev. set properties
						call['isOpen'] = app.data.Calls[i].isOpen;
						call['openIndex'] = app.data.Calls[i].openIndex;
						call['stationUnits'] = app.data.Calls[i].stationUnits;
					}
				});
					
				app.data.Calls = response.data.results;
				//app.data.Notes = response.data.Notes;
				
				Vue.nextTick(function(){
					// Direct to call number in URL
					if(app.directLinkCall && app.directLinkCall != ''){
						app.goToCallnumber(app.directLinkCall);
						app.directLinkCall = '';
					}
					
					if(checkStation){
						app.filteredCalls_Station = app.data.Calls.filter(function(call){
							return (call.unitcount > 0 && call.stationUnits.length > 0); // cannot restrict to FIR
						}).map(function(call, index){
							return {callnumber: call.callnumber, complaint:call.complaint, location:call.locationaddr, stationUnits: call.stationUnits};
						});
					}
				});
					
				app.callsPolling = true;
				if (app.callsPollingSec != 'OFF'){
					setTimeout(app.pollingCalls, app.callsPollingMS);
				}
			}, function(response){
				app.callsPolling = false;
				if (app.callsPollingSec != 'OFF'){
					setTimeout(app.pollingCalls, app.callsPollingMS);
				}
			});		
		},
		pollingNotes: function(){
			var self = this;
			this.$http.jsonp('http://eservices.cityoflewisville.com/citydata/', {method: 'POST', params: {
				datasetid: 'AVL3_PollingNotes',
				oauthtoken: OAUTH.access_token,
				datasetformat: 'jsonp',
				callback: 'data'
			}}).then(
			function(response){
				//console.log(response.data.results);

				app.data.Notes = response.data.results;
					
				app.notesPolling = true;
				if (app.callsPollingSec != 'OFF'){
					setTimeout(app.pollingNotes, app.callsPollingMS);
				}
			}, function(response){
				app.notesPolling = false;
				if (app.callsPollingSec != 'OFF'){
					setTimeout(app.pollingNotes, app.callsPollingMS);
				}
			});
		},
		pollingVehicles: function(){
			var self = this;
			this.$http.jsonp('http://eservices.cityoflewisville.com/citydata/', {method: 'POST', params: {
				datasetid: 'AVL3_PollingVehicles',
				oauthtoken: OAUTH.access_token,
				datasetformat: 'jsonp',
				callback: 'data'
			}}).then(
			function(response){
				//console.log(response.data);		
				response.data.results.forEach(function(vehicle, index){
					var i = app.data2.Vehicles.findIndex(function (v){
						return v.modemid == vehicle.modemid;
					});
					if (i == -1){
						vehicle['isOpen'] = false;
						vehicle['openIndex'] = 0;
					}
					else{
						vehicle['isOpen'] = app.data2.Vehicles[i].isOpen;
						vehicle['openIndex'] = app.data2.Vehicles[i].openIndex;
					}
				});
				
				app.data2.Vehicles = response.data.results;
				app.vehiclesPolling = true;
				if (app.vehiclesPollingSec != 'OFF'){
					setTimeout(app.pollingVehicles, app.vehiclesPollingMS);
				}
			}, function(response){
				app.vehiclesPolling = false;
				if (app.vehiclesPollingSec != 'OFF'){
					setTimeout(app.pollingVehicles, app.vehiclesPollingMS);
				}
			});
		},
		
	},
	ready: function() {
		console.log('AVL 3.4 Polling Version using legacy webservice updated 6/16/17');
		location.hash = hashstring;
		
		// Solution: https://github.com/vuejs/vue/issues/1915
		window.addEventListener('resize', this.handleResize);
		var self = this;
		
		this.pollingCalls();
		this.pollingNotes();
		this.pollingVehicles();
		
		if(/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|ipad|iris|kindle|Android|Silk|lge |maemo|midp|mmp|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino/i.test(navigator.userAgent) 
					|| /1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(navigator.userAgent.substr(0,4))
		){
			self.isMobile = true;
		}
		
		var initialParams = location.hash;
		
		if (initialParams != ""){
			var match;
			
			// Views
			
			match = RegExp('view=([^&]*)').exec(initialParams);
			if ( match && match[1] == 'map' ){
				self.radioValue = 'Map';
			}
			else if ( match && match[1] == 'list' ){
				self.radioValue = 'List';
			}
			
			match = RegExp('narrative').exec(initialParams);
			if (match){
				self.showNarrative = true;
			}
			match = RegExp('layers').exec(initialParams);
			if (match){
				// check if user has incorrect params: either layers OR vehicles - cannot be both
				match2 = RegExp('vehicles').exec(initialParams);
				if (match2){
					self.showVehicles = true;
				}
				else{
					self.showGIS = true;
				}
			}
			else{
				match = RegExp('vehicles').exec(initialParams);
				if (match){
					self.showVehicles = true;
				}
			}
			
			// Options
			
			match = RegExp('traffic').exec(initialParams);
			if (match){
				self.showTrafficLayer = true;
			}
			
			// Filters
			
			match = RegExp('department=([^&]*)').exec(initialParams);
			if ( match &&  match[1] == 'police' ){
				self.department = 'POL';
			}
			if ( match &&  match[1] == 'fire' ){
				self.department = 'FIR';
			}
			match = RegExp('xp9').exec(initialParams);
			if (match){
				self.showP9 = false;
			}
			match = RegExp('station=([^&]*)').exec(initialParams);
			if(match){
				self.setNight = 'AUTO';
				self.station = match[1].toUpperCase();
				switch(self.station.slice(-1)){
					case '1':
						self.centerDefault = {lat: 33.043602, lng: -97.0233208};
						break;
					case '2':
						self.centerDefault = {lat: 33.0449413, lng: -96.9856088};
						break;
					case '3':
						self.centerDefault = {lat: 33.0125507, lng: -96.9913275};
						break;
					case '4':
						self.centerDefault = {lat: 33.0734719, lng: -97.0355181};
						break;
					case '5':
						self.centerDefault = {lat: 33.0125984, lng: -96.9731496};
						break;
					case '6':
						self.centerDefault = {lat: 33.0466656, lng: -96.9292659};
						break;
					case '7':
						self.centerDefault = {lat: 33.0314835, lng: -96.9944059};
						break;
				}
			}
			
			match = RegExp('night=([^&]*)').exec(initialParams);
			if (match){
				self.setNight = match[1].toUpperCase();
			}
			
			match = RegExp('developer').exec(initialParams);
			if (match){
				self.devITS = true;
			}
			/*
			match = RegExp('callpoll=([^&]*)').exec(initialParams);
			if (match){
				self.callsPollingSec = match[1].toUpperCase();
			}
			match = RegExp('vehiclepoll=([^&]*)').exec(initialParams);
			if (match){
				self.vehiclesPollingSec = match[1].toUpperCase();
			}
			*/
			
			// Get call number for direct link
			match = RegExp('callnumber=([^&]*)').exec(initialParams);
			if(match){
				self.directLinkCall = match[1];
				location.hash = initialParams.slice(1).replace(/(&*)callnumber=([^&]*)/, '')
			}
			
		}
		
		
		// Add watches after the initial set from URL parameters
		// Wait, why not on the inital set??? - 4/27
		
		self.$watch('radioValue', function(newVal, oldVal){
			self.$broadcast('g-resize-map');
		})
		self.$watch('showNarrative', function(newVal, oldVal){
			self.$broadcast('g-resize-map');
		})
		self.$watch('showGIS', function(newVal, oldVal){
			self.$broadcast('g-resize-map');
			
			if(newVal && self.showVehicles){
				self.showVehicles = !(self.showVehicles);
			}
		})
		self.$watch('showVehicles', function(newVal, oldVal){
			self.$broadcast('g-resize-map');
			if(newVal && self.showGIS){
				self.showGIS = !(self.showGIS);
			}
		})

		
		// Add watch to currentRoute to update hash for future changes
		self.$watch('currentRoute', function(newVal, oldVal){
			location.hash = newVal;
		})
		
		// Uses vue-resource
		// Get layer information from Google Spreadsheet
		this.$http.get("https://spreadsheets.google.com/feeds/list/1q2t8kR4fme1D0Us2EZmsj3LjBQ2QxD0lfl2db68hF2Q/1/public/values?&alt=json&sq=label%3E%22%22%20and%20id%3C%3E%22ID%22").then(
			function(response) {
				//Success Callback
				
				self.layers = response.body.feed.entry.map(function(obj, i){
					lyr = {};
					Object.keys(obj).forEach(function(x){
						if(x.substr(0,4)=='gsx$' || x=='updated'){
							if(x == 'gsx$infowindowcolumns'){
								lyr[x.replace('gsx$','')] = obj[x].$t.split(",").map(function(obj){return obj.toLowerCase()});
							}
							else{
								lyr[x.replace('gsx$','')] = obj[x].$t;
							}
						}
					});
					
					// Set other properties for each layer object
					lyr.isloading = false;
					lyr.toggleOrder = parseInt(9 + lyr.id);
					lyr.mapservice = {};
					lyr.legend = [];
					
					// Activate layers if open on load is true
					if(lyr.avlopenonload.toLowerCase() == "true"){
						lyr.active = true;
					}
					else{
						lyr.active = false;
					}
					
					return lyr;
				});
				
				//console.log(self.layers);
				
			}, function (response) {
				// error callback
				alert("Error loading GIS Layers - no response from spreadsheet");
			});
			
		VueGoogleMap.loaded.then(function(map) {
			//console.log('the google map library has been loaded');
			self.mapLoaded = true;
		})
	},
	 beforeDestroy: function () {
		window.removeEventListener('resize', this.handleResize);
	},
});



// When vue google maps loads, vueGoogleMapsInit is the callback
// Add arcgis, then callback arcGISInit
// vue-google-maps.js file is modified to resolve the promise after window.arcGISInit
var vueGoogleMapsInit = function(){
	//console.log("vueGoogleMapsInit");
	var script = document.createElement( "script" );
	script.type = "text/javascript";
	if(script.readyState) {  //IE
		script.onreadystatechange = function() {
			if ( script.readyState === "loaded" || script.readyState === "complete" ) {
				script.onreadystatechange = null;
				arcGISInit();
			}
		};
	}
	else {  //Others
		script.onload = function() {
			arcGISInit();
		};
	}

	script.src = 'scripts/arcgislink.js';
	document.body.appendChild( script );
}

</script>

</body>
</html>
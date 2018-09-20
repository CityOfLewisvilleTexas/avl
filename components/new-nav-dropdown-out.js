Vue.component('new-nav-dropdown-out', {
	props: ['newNotes', 'callsNewNotes'],
	template:`
	<dropdown slot="right" class="pull-right hide-out-collapse">
		<button slot="button" class="btn btn-link navbar-btn dropdown-toggle" v-show="newNotes.length > 0"><span class="badge">{{newNotes.length}} <span class="caret"></span></span></button>
		<li v-for="call in callsNewNotes"><a v-on:click="app.clickCallNotification(call)">{{call.complaint}} <span class="badge">{{filterNotesByCallNumber_New(call.callnumber).length}}</span></a></li>
	</dropdown>
	`,
	data: function(){
		return{
		}
	},
	methods:{
		filterNotesByCallNumber_New: function(callnumber){
			return this.newNotes.filter(function(note){
				return note.callnumber == callnumber; 
			});
		},
	}
})
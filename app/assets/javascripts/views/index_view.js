RideologyApp.Views.IndexView = Backbone.View.extend({
	initialize: function(options){
		this.collection = options.collection;
		this.listenTo(this.collection, "add remove reset", this.render);
	},
	render: function(){
		this.$el.html(JST["rides/index"]({ coll: this.collection }))
		return this;
	}
	
})
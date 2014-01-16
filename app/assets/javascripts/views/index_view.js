RideologyApp.Views.IndexView = Backbone.View.extend({
	initialize: function(options){
		this.collection = options.collection;
		this.listenTo(this.collection, "add remove reset", this.render);
	},
	render: function(){
		this.$el.text("check this out!");
		return this;
	}
	
})
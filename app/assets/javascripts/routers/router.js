RideologyApp.Routers.Router = Backbone.Router.extend({
	initialize: function(options){
		this.$rootEl = options.$rootEl;
	},
	
	routes: {
		"":"index",
		"about": "about",
		"post": "postRideOffer"
	},
	index: function(){
		var that = this;
		var coll = new RideologyApp.Collections.RideOffers();
		coll.fetch({
			success: function(){
				var view = new RideologyApp.Views.IndexView({
					collection: coll
				});
				that._swapView(view);
			}
		})
	},
	
	about: function(){
		console.log("=}=}=}=}=}=}=}=}=}=}")
		var view = new RideologyApp.Views.AboutView();
		this._swapView(view);
	},
	postRideOffer: function(){
		var view = new RideologyApp.Views.PostRideOfferView();
		this._swapView(view);
		
	},
	
	_swapView: function(view){
		this._currentView && this._currentView.remove();
		this._currentView = view;
		this.$rootEl.html(this._currentView.render().$el);
	}
	
})
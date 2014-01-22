RideologyApp.Routers.Router = Backbone.Router.extend({
	initialize: function(options){
		this.$rootEl = options.$rootEl;
	},
	
	routes: {
		"":"index",
		"user": "user",
		"post": "postRideOffer",
    "search": "search"
	},
	index: function(){
		var that = this;
		var coll = RideologyApp.rideOffers
		coll.fetch({
      data: {page: 1},
			success: function(){
				var view = new RideologyApp.Views.IndexView({
					collection: coll
				});
				that._swapView(view);
			}
		})
	},
	
	user: function(){
		var view = new RideologyApp.Views.UserView({
		  model: RideologyApp.currentUser
		});
		this._swapView(view);
	},
  
	postRideOffer: function(){
		var view = new RideologyApp.Views.PostRideOfferView();
		this._swapView(view);
		
	},
  
  search: function(){
    var view = new RideologyApp.Views.SearchRideOfferView();
    this._swapView(view);
  },
	
	_swapView: function(view){
		this._currentView && this._currentView.remove();
		this._currentView = view;
		this.$rootEl.html(this._currentView.render().$el);
	}
	
})
window.RideologyApp = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    RideologyApp.currentUser = new RideologyApp.Models.CurrentUser();
    RideologyApp.currentUser.fetch({
      success: function(model){
    	  RideologyApp.rideOffers = new RideologyApp.Collections.RideOffers();
     	  new RideologyApp.Routers.Router({
     		  $rootEl: $('.bbhandle')
     	  });
     	  Backbone.history.start();
      }
    })
  }
};



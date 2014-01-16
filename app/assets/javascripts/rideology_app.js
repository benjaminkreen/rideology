window.RideologyApp = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
	  alert("For reals");
	  // RideologyApp.rideOffers = new RideologyApp.Collections.RideOffers();
 // 	  new RideologyApp.Routers.Router({
 // 		  $rootEl: $('.bbhandle')
 // 	  });
 // 	  Backbone.history.start();
  }
};

$(document).ready(function(){
  RideologyApp.initialize();
});

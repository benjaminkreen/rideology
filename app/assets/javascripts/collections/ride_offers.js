RideologyApp.Collections.RideOffers = Backbone.Collection.extend({
	url: "/api/ride_offers",
  
	model: RideologyApp.Models.RideOffer
})
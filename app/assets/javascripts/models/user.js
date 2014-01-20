RideologyApp.Models.CurrentUser = Backbone.Model.extend({
  urlRoot: '/users.json',
  parse: function(response){
    var rideOffers = new RideologyApp.Collections.RideOffers(response.ride_offers, {parse: true});
    response.ride_offers = rideOffers;
    return response;
  }
})
RideologyApp.Models.CurrentUser = Backbone.Model.extend({
  urlRoot: '/users',
  parse: function(response){
    var rideOffers = new RideologyApp.Collections.RideOffers(response.ride_offers, {parse: true});
    var takes = new RideologyApp.Collections.UserTakes(response.takes);
    response.takes = takes;
    response.ride_offers = rideOffers;
    return response;
  }
})
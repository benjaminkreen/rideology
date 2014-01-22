RideologyApp.Models.RideOffer = Backbone.Model.extend({
  urlRoot: ""
  parse: function(data){
    if (data.passengers){
      var passengers = data.passengers;
      data.passengers = new RideologyApp.Collections.Passengers(passengers);
    } else {
      data.passengers = new RideologyApp.Collections.Passengers([]);
    }
    return data;
  }
})
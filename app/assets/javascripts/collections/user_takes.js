RideologyApp.Collections.UserTakes = Backbone.Collection.extend({
  url: 'api/ride_takes',
  model: RideologyApp.Models.UserTake
})
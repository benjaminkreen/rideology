RideologyApp.Models.RideTake = Backbone.Model.extend({
  urlRoot: 'api/ride_takes',
  toJSON: function(){
    return { ride_take: _.clone(this.attributes)}
  }
})
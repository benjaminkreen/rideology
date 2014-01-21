RideologyApp.Models.RideTake = Backbone.Model.extend({
  urlRoot: 'api/ride_takes',
  toJSON: function(){
    console.log(this.attributes);
    return { ride_take: _.clone(this.attributes)}
  }
})
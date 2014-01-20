RideologyApp.Views.UserView = Backbone.View.extend({
  initialize: function(){
    this.rides = this.model.get("ride_offers");
    this.listenTo(this.rides, "all", this.render);
  },
  
  render: function(){
    var content = JST['users/user']({ user: this.model, rides: this.rides });
    this.$el.html(content);
    return this;
  }
})
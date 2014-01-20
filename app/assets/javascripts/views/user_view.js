RideologyApp.Views.UserView = Backbone.View.extend({
  render: function(){
    var rides = this.model.get("ride_offers");
    var content = JST['users/user']({ user: this.model, rides: rides });
    this.$el.html(content);
    return this;
  }
})
RideologyApp.Views.UserView = Backbone.View.extend({
  initialize: function(){
    this.rides = this.model.get("ride_offers");
    this.takes = this.model.get("takes")
    this.listenTo(this.rides, "all", this.render);
    this.listenTo(this.takes, "all", this.render)
  },
  
  render: function(){
    console.log(this.rides);
    var content = JST['users/user']({ user: this.model, rides: this.rides, takes: this.takes });
    this.$el.html(content);
    return this;
  }
})
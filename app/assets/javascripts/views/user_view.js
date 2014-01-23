RideologyApp.Views.UserView = Backbone.View.extend({
  initialize: function(){
    this.rides = this.model.get("ride_offers");
    this.takes = this.model.get("takes")
    this.listenTo(this.rides, "all", this.render);
    this.listenTo(this.takes, "all", this.render)
  },
  
  events:{
    "click button.remove-take": "removeTake",
    "click button.remove-ride-offer": "removeRideOffer"
  },
  
  render: function(){
    var content = JST['users/user']({ user: this.model, rides: this.rides, takes: this.takes });
    this.$el.html(content);
    $('.n-link').removeClass('active');
    $('#user-link').addClass('active');
    return this;
  },
  
  removeTake: function(event){
    var that = this;
    var id = $(event.currentTarget).attr("data-id");
    this.takes.remove({id: id});
    $.ajax({
      url: "/api/ride_takes/1",
      type: "DELETE",
      data: {
        ride_offer_id: id
      }
    });
  }
})  
RideologyApp.Views.PostRideOfferView = Backbone.View.extend({
  render: function(){
    this.$el.html(JST['rides/ride_offer_post_form']);
    this.$('.datepicker').datepicker({minDate: new Date()});
    return this;
  },
  
  events:{
    "click button.submit": "postForm"
    
  },
  
  postForm: function(event){
    event.preventDefault();
    var formData = this.$('form').serializeJSON();
    console.log(formData['ride_offer']);
    RideologyApp.rideOffers.create(formData['ride_offer']);
    Backbone.history.navigate("", {trigger: true});
  }
})
RideologyApp.Views.PostRideOfferView = Backbone.View.extend({
  render: function(){
    this.$el.html(JST['rides/ride_offer_post_form']);
    this.$('.datepicker').datepicker({minDate: new Date()});
    return this;
  },
  
  events:{
    
  }
})
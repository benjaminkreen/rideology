RideologyApp.Views.PostRideOfferView = Backbone.View.extend({
  render: function(){
    this.$el.html(JST['rides/ride_offer_post_form']);
    this.$('.datepicker').datepicker({
      minDate: new Date(),
      dateFormat: "yy-mm-dd"
    });
    return this;
  },
  
  events:{
    "click button.submit": "postForm"
    
  },
  
  postForm: function(event){
    event.preventDefault();
    var formData = this.$('form').serializeJSON();
    console.log(formData['ride_offer']);
    RideologyApp.currentUser.get('ride_offers').create(formData['ride_offer'], {
      success: function(){
        alert("Ride posted!");
      },
      error: function(){
        alert("Something went wrong, are you logged in?");
      }
    });
    Backbone.history.navigate("", {trigger: true});
  }
})
RideologyApp.Collections.RideOffers = Backbone.Collection.extend({
	url: "/api/ride_offers",
  
  parse: function(response){
    if(response.page_number){
      this.page_number = parseInt(response.page_number);
      this.total_pages = parseInt(response.total_pages);
    }
    if (response.ride_offers){
      return response.ride_offers;
    }else{
      return response;
    }
  },
  
	model: RideologyApp.Models.RideOffer
})
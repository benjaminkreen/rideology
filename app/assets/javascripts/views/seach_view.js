RideologyApp.Views.SearchRideOfferView = Backbone.View.extend({
  initialize: function(){
    this.collection = new RideologyApp.Collections.RideOffers();
    this.listenTo(this.collection, "all", this.render);
  },
  
  events: {
    "click button.submit":"search"
  },
  
  template: JST['rides/search'],
  
  render:function(){
    this.$el.html(this.template({coll: this.collection}));
    this.$('.datepicker').datepicker({
      minDate: new Date(),
      dateFormat: "yy-mm-dd"
    });
    this.$('.droppable').droppable({
        hoverClass: "ui-state-hover",
        drop: function(event, ui){
          var roID = $(event.target).data('id')
          var take = new RideologyApp.Models.RideTake({ride_offer_id: roID });
          take.save({},{
            success: function(){
              RideologyApp.currentUser.fetch();
              alert("Ride added");
              $(event.target).droppable("option", "disable", true);
            },
            error: function(){
              alert("Must be logged in to do that");
            }
          });
        }
    });
    $('.n-link').removeClass('active');
    $('#search-link').addClass('active');
    return this;
  },
  
  search: function(event){
    event.preventDefault();
    var searchData = this.$('form').serializeJSON();
    this.collection.fetch({
      data: searchData
    })
  }
})
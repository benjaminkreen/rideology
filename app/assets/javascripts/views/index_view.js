RideologyApp.Views.IndexView = Backbone.View.extend({
	initialize: function(options){
		this.collection = options.collection;
		this.listenTo(this.collection, "add remove reset", this.render);
	},
	render: function(){
		this.$el.html(JST["rides/index"]({ coll: this.collection }));
    this.$('.droppable').droppable({
        drop: function(event, ui){
          var roID = $(event.target).data('id')
          var take = new RideologyApp.Models.RideTake({ride_offer_id: roID });
          take.save({},{
            success: function(){
              RideologyApp.currentUser.fetch();
              alert("Ride added");
              $(event.target).droppable("option", "disable", true);
            }
          })
        }
    });
		return this;
	}
	
})
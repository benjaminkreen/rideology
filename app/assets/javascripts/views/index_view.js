RideologyApp.Views.IndexView = Backbone.View.extend({
	initialize: function(options){
		this.collection = options.collection;
		this.listenTo(this.collection, "add remove reset", this.render);
	},
	render: function(){
		this.$el.html(JST["rides/index"]({ coll: this.collection }));
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
            }
          })
        }
    });
    this.listenForScroll();
    $('.pop').popover({
      container: 'body',
      placement: 'bottom',
      trigger: 'manual',
      title: 'Pro Tip',
      content: 'Drag this icon into a ride bellow to sign up!',
    });
    $('.pop').popover('show');
    setTimeout(function(){
      $('.pop').popover('hide');
      $('#draggable').toggleClass('pop');
    }, 5000);
		return this;
	},
  
  listenForScroll: function(){
    $(window).off("scroll");
    var throttledCallback = _.throttle(this.nextPage.bind(this), 200);
    $(window).on("scroll", throttledCallback);
  },
  
  nextPage: function(){
    var that = this;
    if ($(window).scrollTop() > $(document).height() - $(window).height() - 50){
      if(that.collection.page_number < that.collection.total_pages){
        that.collection.fetch({
          data: {page: that.collection.page_number + 1},
          remove: false,
          wait: true
        });
      }
    }
  }
	
});
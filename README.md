# Rideology #

An App Academy final project. Not so loosely based on zimride. Implemented on Rails, Backbone and Bootsrap. Features forthcoming.

### Key features:

* User Auth
* Create ride offers
* Take ride offers
  * Undo Takes
* Search for rides (case-sensitive)


### Implemented tech:

* Ruby on Rails
  * DB managed with postgreSQL
  * API data constructed with jBuilder
* Backbone.js
  * Infinite Scrolling (with kaminari gem)
* jQuery.ui
  * Datepicker
  * Sortable
    * Added custom sortable cursor courtesy of http://blog.arlenabraham.com/?p=5
  * Drag and droppable
* Twitter Bootstrap
  * Modals
  * Fixed Navbar
* Heroku
  * Sendgrid

### TODO:

* Allow for deleteing ride offers
* Prevent users from signing up for their own rides
* Add logic to subtract passangers from total spots
* Make search not case-sensitive
* Refactor routes to be more RESTful
* Trigger emails 

  
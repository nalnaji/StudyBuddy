class StudyBuddy.Routers.Locations extends Backbone.Router
  routes:
    'banana/:courseid': 'showChat'

  initialize: ->
    @locations = new StudyBuddy.Collections.Locations()
    @locations.fetch()
    @listenTo StudyBuddy.vent, 'courses:selected', @showLocations

  showLocations: (course) ->
    @locations.setCourse(course.get 'id')
    @locations.fetch()
    view = new StudyBuddy.Views.LocationsList(collection: @locations)
    $('#locations_list').html(view.render().el)
    $("#search_locations").focus()
  
 showChat: (courseid) ->
   console.log('show chat :D')

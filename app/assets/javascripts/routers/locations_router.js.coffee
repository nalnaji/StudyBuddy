class StudyBuddy.Routers.Locations extends Backbone.Router
  routes:
    'course/:courseid/location/:locationid': 'showChat'

  initialize: ->
    @locations = locations
    @listenTo StudyBuddy.vent, 'courses:selected', @showLocations

  showLocations: (course) ->
    @locations.setCourse(course.get 'id')
    @locations.fetch()
    view = new StudyBuddy.Views.LocationsList(collection: @locations)
    $('#locations_list').html(view.render().el)
    $("#search_locations").focus()
  
  showChat: (courseid, locationid) ->
    StudyBuddy.vent.trigger 'browser:showCourse', courseid
    loc = @locations.get locationid
    @locations.setSelected(loc)
    view = new StudyBuddy.Views.LocationsList(collection: @locations)
    $('#locations_list').html(view.render().el)
    $("#search_locations").focus()

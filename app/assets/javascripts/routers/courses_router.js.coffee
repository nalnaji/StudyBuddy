class StudyBuddy.Routers.Courses extends Backbone.Router
  routes:
    '': 'index'
    '_=_': 'index'
    'course/:courseid': 'showLocations'
  
  initialize: ->
    @collection = courses
    @listenTo StudyBuddy.vent, 'browser:showCourse', @showLocations

  index: ->
    view = new StudyBuddy.Views.CoursesList(collection: @collection)
    $('#courses-list').html(view.render().el)
    $("#search_courses").focus()


  showLocations: (courseid) ->
    course = @collection.get courseid
    @collection.setSelected(course)
    view = new StudyBuddy.Views.CoursesList(collection: @collection)
    $('#courses-list').html(view.render().el)
    $("#search_courses").focus()

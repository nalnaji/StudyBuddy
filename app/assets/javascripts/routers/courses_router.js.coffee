class StudyBuddy.Routers.Courses extends Backbone.Router
  routes:
    '': 'index'
    'course/:courseid': 'showLocations'
  
  initialize: ->
    @collection = new StudyBuddy.Collections.Courses()
    @collection.fetch()

  index: ->
    view = new StudyBuddy.Views.CoursesList(collection: @collection)
    $('#courses-list').html(view.render().el)
    $("#search_courses").focus()

  showLocations: (courseid) ->
    @collection.fetch(async: false)
    course = @collection.get courseid
    @collection.setSelected(course)
    view = new StudyBuddy.Views.CoursesList(collection: @collection)
    $('#courses-list').html(view.render().el)
    $("#search_courses").focus()

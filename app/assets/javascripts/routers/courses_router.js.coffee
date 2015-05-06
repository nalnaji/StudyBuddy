class StudyBuddy.Routers.Courses extends Backbone.Router
  routes:
    '': 'index'
  
  initialize: ->
    @collection = new StudyBuddy.Collections.Courses()
    @collection.fetch()

  index: ->
    view = new StudyBuddy.Views.CoursesList(collection: @collection)
    $('#courses-list').html(view.render().el)

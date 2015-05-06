class StudyBuddy.Views.CoursesList extends Backbone.View
  template: JST['courses/list']
  className: 'bs-component list-group'
  initialize: ->
    @collection.on('sync', @render, this)

  render: ->
    $(@el).html(@template())
    $("#search_courses").focus()
    @collection.each(@appendCourse)
    this

  appendCourse: (course) =>
    view = new StudyBuddy.Views.CoursesRow(model: course)
    @$('#course-list').append(view.render().el)

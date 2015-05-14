class StudyBuddy.Views.CoursesList extends Backbone.View
  template: JST['courses/list']
  className: 'bs-component list-group'
  initialize: ->
    @listenTo @collection, 'remove', @update
    @listenTo @collection, 'add', @update
    @listenTo @collection, 'sort', @update

  events:
    'keyup #search_courses': 'search'

  render: ->
    $(@el).html(@template())
    @update()
    this

  update: ->
    $("#course-list").empty()
    @collection.each(@appendCourse)
    
  search: ->
    query = $("#search_courses").val()
    @collection.search(query)

  appendCourse: (course) =>
    view = new StudyBuddy.Views.CoursesRow(model: course)
    @$('#course-list').append(view.render().el)

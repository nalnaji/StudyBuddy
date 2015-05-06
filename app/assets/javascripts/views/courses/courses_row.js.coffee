class StudyBuddy.Views.CoursesRow extends Backbone.View
  template: JST['courses/row']

  events: ->
    'click .course_link': 'selectCourse'

  render: ->
    $(@el).html(@template(course: @model))
    this
  
  selectCourse: (event) ->
    name = @model.get('name')
    alert(name)

class StudyBuddy.Views.CoursesRow extends Backbone.View
  template: JST['courses/row']

  events: ->
    'click .course_link': 'selectCourse'

  render: ->
    $(@el).html(@template(course: @model))
    this
  
  initialize: ->
    @listenTo @model, 'change', @render

  selectCourse: (event) ->
    @model.setSelected()
    Backbone.history.navigate('course/' + @model.get('id'))
    this.render()

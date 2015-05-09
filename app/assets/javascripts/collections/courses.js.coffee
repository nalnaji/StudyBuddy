class StudyBuddy.Collections.Courses extends Backbone.Collection
  url: ->
    if @query == ''
      '/api/courses'
    else
      '/api/courses/search/' + @query

  model: StudyBuddy.Models.Course

  initialize: ->
    @query = ''
    @selected = null
    @listenTo StudyBuddy.vent, 'tick:10secs', @poll

  poll: ->
    this.fetch()

  search: (query) ->
    @query = query
    this.resetSelected()
    this.fetch()
    Backbone.history.navigate('')

  setSelected: (course) ->
    if @selected
      @selected.set('selected', false)
    course.set('selected', true)
    @selected = course
    StudyBuddy.vent.trigger 'courses:selected', @selected

  resetSelected: ->
    if @selected
      @selected.set 'selected', false
    @selected = null
    $("#locations_list").empty()
    StudyBuddy.vent.trigger 'courses:deselected'

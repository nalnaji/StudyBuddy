class StudyBuddy.Collections.Locations extends Backbone.Collection
  url: ->
    if @course and @query.trim().length > 0
      '/api/locations/search/' + @query + '/' + @course.get('id')
    else if @course
      'api/locations/course/' + @course.get('id')
    else
      '/api/locations/course/-1'

  initialize: ->
    @course = null
    @query = ''
    @selected = null
    @listenTo StudyBuddy.vent, 'courses:selected', @resetSelected
    @listenTo StudyBuddy.vent, 'tick:10secs', @poll

  poll: ->
    this.fetch() if @course

  setCourse: (courseid) ->
    @course = new StudyBuddy.Models.Course(id: courseid)
    @course.fetch()
    this.fetch()

  search: (query) ->
    @query = query
    this.fetch()

  setSelected: (location) ->
    if @selected
      @selected.set('selected', false)
    location.set('selected', true)
    @selected = location
    Backbone.trigger 'locations:selected'
    Backbone.history.navigate('course/' + @course.get('id') + '/location/' + @selected.get 'id', true)

  model: StudyBuddy.Models.Location

  resetSelected: ->
    if @selected
      @selected.set 'selected', false
    @selected = null
    if @course
      Backbone.history.navigate('course/' + @course.get 'id')
    Backbone.trigger 'locations:deselected'

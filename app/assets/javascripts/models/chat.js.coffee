class StudyBuddy.Models.Chat extends Backbone.Model
  url: ->
    if @course and @location
      "/api/chats/course/#{@course.get('id')}/location/#{@location.get('id')}"
    else
      '/api/chats/-1/-1'
  
  initialize: ->
    @course = null
    @location = null
    @listenTo StudyBuddy.vent, 'courses:selected', @updateCourse
    @listenTo StudyBuddy.vent, 'courses:deselected', @resetCourse
    @listenTo StudyBuddy.vent, 'locations:selected', @updateLocation
    @listenTo StudyBuddy.vent, 'locations:deselected', @resetLocation

  resetLocation: ->
    @location = null
    StudyBuddy.vent.trigger 'chats:remove'
  
  updateLocation: (loc) ->
    @location = loc
    StudyBuddy.vent.trigger 'chats:update', this
    this.fetch()
    console.log this

  resetCourse: ->
    @course = null
    @resetLocation()

  updateCourse: (course) ->
    @course = course
    @resetLocation()

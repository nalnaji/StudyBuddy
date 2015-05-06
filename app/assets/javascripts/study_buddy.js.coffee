window.StudyBuddy =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new StudyBuddy.Routers.Courses()
    Backbone.history.start()

$(document).ready ->
  StudyBuddy.initialize()

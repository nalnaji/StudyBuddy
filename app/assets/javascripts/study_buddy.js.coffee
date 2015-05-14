window.StudyBuddy =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  vent: _.extend({}, Backbone.Events)
  initialize: ->
    new StudyBuddy.Routers.Courses()
    new StudyBuddy.Routers.Locations()
    new StudyBuddy.Routers.Chats()
    Backbone.history.start()
    setInterval ->
      StudyBuddy.vent.trigger('tick:10secs')
    , 5000
$(document).ready ->
  StudyBuddy.initialize()

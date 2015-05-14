class StudyBuddy.Routers.Chats extends Backbone.Router
  routes:
    'bananaieaf': 'hello'

  initialize: ->
    @chat = new StudyBuddy.Models.Chat()
    @listenTo StudyBuddy.vent, 'chats:remove', @remove
    @listenTo StudyBuddy.vent, 'chats:update', @displayChat

  displayChat: (chat) ->
    view = new StudyBuddy.Views.Chatroom(model: chat)
    $('#chatroom').html(view.render().el)
    $('#new_message').focus()
    console.log "display chat"

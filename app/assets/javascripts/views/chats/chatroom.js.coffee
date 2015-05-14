class StudyBuddy.Views.Chatroom extends Backbone.View
  template: JST['chats/chatroom']

  initialize: ->
    @listenTo StudyBuddy.vent, 'chats:remove', @remove

  render: ->
    $(@el).html(@template(chat: @model))
    this

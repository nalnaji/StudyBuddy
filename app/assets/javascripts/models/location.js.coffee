class StudyBuddy.Models.Location extends Backbone.Model
  setSelected: ->
    this.collection.setSelected(this)

  urlRoot: 'api/locations'

  defaults:
    selected: false

  initialize: ->
    @listenTo this, 'change', @update
  
  update: ->

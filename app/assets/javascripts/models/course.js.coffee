class StudyBuddy.Models.Course extends Backbone.Model
  setSelected: ->
    this.collection.setSelected(this)

  urlRoot: 'api/courses'

  defaults:
    selected: false

  initialize: ->
    @listenTo this, 'change', @update
  
  update: ->

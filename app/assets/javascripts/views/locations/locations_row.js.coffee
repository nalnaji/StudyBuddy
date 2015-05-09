class StudyBuddy.Views.LocationsRow extends Backbone.View
  template: JST['locations/row']

  events: ->
    'click .locations_link': 'selectLocation'
  
  initialize: ->
    @listenTo @model, 'change', @render

  render: ->
    $(@el).html(@template(location: @model))
    this
  
  selectLocation: (event) ->
    @model.setSelected()
    this.render()

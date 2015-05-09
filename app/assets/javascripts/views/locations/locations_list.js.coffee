class StudyBuddy.Views.LocationsList extends Backbone.View
  template: JST['locations/list']
  className: 'bs-component list-group'
  
  events:
    'keyup #search_locations': 'search'
    
  initialize: ->
    @listenTo @collection, 'add', @update
    @listenTo @collection, 'sync', @update
    @listenTo @collection, 'remove', @update
    @listenTo StudyBuddy.vent, 'courses:deselected', @remove
    @listenTo StudyBuddy.vent, 'courses:selected', @collection.resetSelected

  render: ->
    $(@el).html(@template())
    @update()
    this

  update: ->
    $("#locations").empty()
    @collection.each(@appendLocation)
  
  search: ->
    @collection.resetSelected()
    query = $("#search_locations").val()
    @collection.search(query)

  appendLocation: (location) =>
    view = new StudyBuddy.Views.LocationsRow(model: location)
    @$('#locations').append(view.render().el)

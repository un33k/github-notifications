class App.Views.Filter extends Backbone.View
  template: _.template('<a href="#<%= id %>"><%= name %></a>')
  className: 'list'
  tagName: 'li'

  initialize: (options) ->
    @listenTo @model, 'unselected', @unselected
    @listenTo @model, 'selected', @selected

  render: =>
    @$el.html @template(@model.toJSON())
    @selected() if @model.isSelected()
    app.trigger 'render', @
    @

  unselected: ->
    @$('a').removeClass('selected')

  selected: ->
    @$('a').addClass('selected').scrollIntoView(100)

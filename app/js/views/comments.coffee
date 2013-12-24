class app.Views.Comments extends Backbone.View
  initialize: (options) ->
    @collection = new app.Collections.Comments(url: options.url)
    @listenTo @collection, 'add', @addComment
    @listenTo @collection, 'reset', @addAllComments
    @collection.fetch().done(@scroll).done(@paginate)

  paginate: (data, options, xhr) =>
    if link = @nextLink(xhr.getResponseHeader("Link"))
      @collection.fetch(url: link)

  nextLink: (header) =>
    return unless header
    links = _.map header.split(/\s*,\s*/), (link) => new app.Models.Link(link)
    _.find links, (link) -> link.rel == 'next'

  addComment: (comment) ->
    view = new app.Views.Comment(model: comment, notification: @model)
    @$el.append(view.render().el)

  addAllComments: ->
    @collection.each(@add, @)

  scroll: =>
    if position = @$('.conversation-comment.expanded:first').position()
      @$el.closest('.subject').prop 'scrollTop', position.top

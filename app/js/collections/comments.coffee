class App.Collections.Comments extends Backbone.Collection
  model: App.Models.Comment

  initialize: (models, options = {}) ->
    @last_read_at = options.last_read_at

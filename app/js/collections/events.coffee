class app.Collections.Events extends Backbone.Collection
  model: app.Models.Event

  initialize: (models = [], options = {}) ->
    @subject = options.subject
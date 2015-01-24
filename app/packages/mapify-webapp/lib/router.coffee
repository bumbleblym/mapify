Router.onAfterAction (req, res, next) ->
  document.title = 'mapify'

  if @route.options.title?
    document.title += " - #{@route.options.title}"

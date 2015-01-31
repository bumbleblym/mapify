# Set title
Router.onAfterAction ->
  document.title = 'mapify'

  if @route.options.title?
    document.title += " - #{@route.options.title}"

Meteor.methods
  acGameNames: (query, options = {}) ->
    if options.limit?
      options.limit = Math.min 8, Math.abs options.limit
    else
      options.limit = 8

    # 'i' flag to ignore case
    regex = new RegExp query, 'i'

    return Mpf.Collections.games.find
      title:
        $regex: regex
    , options
    .fetch()

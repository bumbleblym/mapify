Security.defineMethod 'ifOwnsDoc',
  fetch: ['userId']
  deny: (type, arg, userId, doc, fieldNames, modifier) ->
    return !userId || userId != doc.userId

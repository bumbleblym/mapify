Security.defineMethod 'ifOwnsDoc',
  fetch: ['userId']
  deny: (type, arg, userId, doc, fieldNames, modifier) ->
    return !userId || userId != doc.userId


Security.defineMethod 'inventoryPartOfTrade',
  deny: (type, arg, userId, doc, fieldNames, modifier) ->
    trade = Mpf.Collections.trades.findOne
      haveIds: doc._id
    return trade?


Security.defineMethod 'wishlistPartOfTrade',
  deny: (type, arg, userId, doc, fieldNames, modifier) ->
    trade = Mpf.Collections.trades.findOne
      wantIds: doc._id
    return trade?


Security.defineMethod 'locationPartOfTrade',
  deny: (type, arg, userId, doc, fieldNames, modifier) ->
    trade = Mpf.Collections.trades.findOne
      locationIds: doc._id
    return trade?

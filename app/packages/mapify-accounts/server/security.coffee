Security.defineMethod 'ifOwnsDoc',
  fetch: ['userId']
  deny: (type, arg, userId, doc, fieldNames, modifier) ->
    return !userId || userId != doc.userId


Security.defineMethod 'isInventoryPartOfTrade',
  deny: (type, arg, userId, doc, fieldNames, modifier) ->
    trade = Mpf.Collections.trades.findOne
      haveIds: doc._id
    return trade?


Security.defineMethod 'isWishlistPartOfTrade',
  deny: (type, arg, userId, doc, fieldNames, modifier) ->
    trade = Mpf.Collections.trades.findOne
      wantIds: doc._id
    return trade?


Security.defineMethod 'isLocationPartOfTrade',
  deny: (type, arg, userId, doc, fieldNames, modifier) ->
    trade = Mpf.Collections.trades.findOne
      locationIds: doc._id
    return trade?


Security.defineMethod 'isValidTradePage',
  fetch: ['userId']
  deny: (type, arg, userId, doc, fieldNames, modifier) ->
    if not doc.locationIds? || doc.locationIds.length < 1
      return true
    if (not doc.haveIds? || doc.haveIds.length < 1) and
        (not doc.wantIds? || doc.wantIds.length < 1)
      return true

    for id in doc.locationIds
      item = Mpf.Collections.locations.findOne
        _id: id
      ,
        userId: true
      if not item? or item.userId != userId
        return true

    for id in doc.haveIds
      item = Mpf.Collections.inventory.findOne
        _id: id
      ,
        userId: true
      if not item? or item.userId != userId
        return true

    for id in doc.wantIds
      item = Mpf.Collections.wishlist.findOne
        _id: id
      ,
        userId: true
      if not item? or item.userId != userId
        return true
    return false

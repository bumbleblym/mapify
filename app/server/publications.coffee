Meteor.publish 'notifications', ->
  return Mpf.Collections.notifications.find
    userId: @userId
    read: false

Meteor.publish 'locations', ->
  return Mpf.Collections.locations.find
    userId: @userId
  ,
    fields:
      createdAt: false

Meteor.publish 'inventory', ->
  return Mpf.Collections.inventory.find
    userId: @userId
  ,
    fields:
      gameId: false

Meteor.publish 'wishlist', ->
  return Mpf.Collections.wishlist.find
    userId: @userId
  ,
    fields:
      gameId: false

Meteor.publish 'myTrades', ->
  return Mpf.Collections.trades.find
    userId: @userId

# XXX limit trades
Meteor.publish 'trades', ->
  sub = @

  locationHandles = {}

  publishTradeLocations = (id, locationIds) ->
    locationsCursor = Mpf.Collections.locations.find
      _id:
        $in: locationIds

    locationHandles[id] = Mongo.Collection._publishCursor locationsCursor, sub, 'locations'

  tradeHandle = Mpf.Collections.trades.find().observeChanges
    added: (id, fields) ->
      publishTradeLocations id, fields.locationIds
      sub.added 'trades', id, fields

    changed: (id, fields) ->
      sub.changed 'trades', id, fields

    removed: (id) ->
      locationHandles[id] && locationHandles[id].stop()

      sub.removed 'trades', id

  sub.ready()

  sub.onStop ->
    tradeHandle.stop()

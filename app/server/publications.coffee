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

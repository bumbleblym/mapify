Meteor.publish 'locations', ->
  return Mpf.Collections.locations.find
    userId: @userId
  ,
    fields:
      createdAt: 0

Meteor.publish 'notifications', ->
  return Mpf.Collections.notifications.find
    userId: @userId
    read: false

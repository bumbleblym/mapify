Meteor.publish 'locations', ->
  return Mpf.Collections.locations.find
    userId: @userId
  ,
    fields:
      createdAt: 0

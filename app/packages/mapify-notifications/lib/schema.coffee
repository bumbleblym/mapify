Mpf.CollectionHelpers.createSchema 'notifications',
  userId:
    type: SimpleSchema.RegEx.Id
    custom: ->
      if @value == @field('senderId').value
        return 'sameIds'

  senderId:
    type: SimpleSchema.RegEx.Id
    custom: ->
      if @value == @field('userId').value
        return 'sameIds'

Mpf.CollectionHelpers.addToSchema 'notifications', Mpf.Schemas.createdAt

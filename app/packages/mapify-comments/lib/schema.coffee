Mpf.CollectionHelpers.createSchema 'comments',
  userId:
    type: SimpleSchema.RegEx.Id

  content:
    type: String

Mpf.CollectionHelpers.addToSchema 'comments', Mpf.Schemas.createdAt

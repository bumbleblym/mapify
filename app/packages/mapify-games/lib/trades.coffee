Mpf.CollectionHelpers.createCollection 'trades'

Mpf.CollectionHelpers.createSchema 'trades',
  userId:
    type: SimpleSchema.RegEx.Id

  # Inventory Id
  haveIds:
    type: [SimpleSchema.RegEx.Id]

  # Wishlist Id
  wantIds:
    type: [SimpleSchema.RegEx.Id]

  # XXX block if offer and want are simultaneously non-zero
  offer:
    type: Number
    min: 0
    defaultValue: 0

  want:
    type: Number
    min: 0
    defaultValue: 0

  description:
    type: String
    optional: true

  # XXX Should be updated to current date when user logs in.
  activeAt:
    type: Date

  commentIds:
    type: [SimpleSchema.RegEx.Id]
    defaultValue: []

  locationIds:
    type: [SimpleSchema.RegEx.Id]

Mpf.CollectionHelpers.addToSchema 'trades', Mpf.Schemas.createdAt

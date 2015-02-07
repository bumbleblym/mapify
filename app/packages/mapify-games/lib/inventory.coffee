Mpf.CollectionHelpers.createCollection 'inventory'

Mpf.CollectionHelpers.createSchema 'inventory',
  userId:
    type: SimpleSchema.RegEx.Id

  gameId:
    type: SimpleSchema.RegEx.Id
    optional: true

  title:
    type: String

  platform:
    type: String
    allowedValues: PLATFORMS

  # false means no preference
  wrapped:
    type: Boolean
    label: 'Shrink wrapped'
    defaultValue: false

  # false means no preference
  dlc:
    type: Boolean
    label: 'Includes DLC'
    defaultValue: false

  pic:
    type: String
    optional: true

  description:
    type: String
    optional: true

Mpf.CollectionHelpers.addToSchema 'inventory', Mpf.Schemas.createdAt

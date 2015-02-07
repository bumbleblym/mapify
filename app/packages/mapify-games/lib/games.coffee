Mpf.CollectionHelpers.createCollection 'games'

Mpf.CollectionHelpers.createSchema 'games',
  title:
    type: String

  # XXX Validate that the platform is a real platform?
  platforms:
    type: [String]
    allowedValues: PLATFORMS
    defaultValue: []

  # XXX Create method to verify platform
  unverifiedPlatforms:
    type: [String]
    defaultValue: []

  verified:
    type: Boolean

Mpf.CollectionHelpers.addToSchema 'games', Mpf.Schemas.createdAt

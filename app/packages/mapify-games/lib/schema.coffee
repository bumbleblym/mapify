PLATFORMS = [
  'PS4'
  'Xbox One'
  'PS3'
  'Xbox 360'
  'PC'
  'Wii-U'
  '3DS'
  'PS Vita'
  'PS2'
  'PS1'
  'Xbox'
  'Wii'
  'DS'
  'GameCube'
  'N64'
  'GameBoy Advance'
  'PSP'
  'Dreamcast'
]

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
    defaultValue: false

  # false means no preference
  dlc:
    type: Boolean
    defaultValue: false

  pic:
    type: String
    optional: true

  description:
    type: String
    optional: true

Mpf.CollectionHelpers.addToSchema 'inventory', Mpf.Schemas.createdAt



Mpf.CollectionHelpers.createSchema 'wishlist',
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
    defaultValue: false

  # false means no preference
  dlc:
    type: Boolean
    defaultValue: false

  description:
    type: String
    optional: true


Mpf.CollectionHelpers.addToSchema 'wishlist', Mpf.Schemas.createdAt



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

  # XXX Should be updated to current date when user logs in.
  activeAt:
    type: Date

  commentIds:
    type: [SimpleSchema.RegEx.Id]
    defaultValue: []

  locationIds:
    type: [SimpleSchema.RegEx.Id]


Mpf.CollectionHelpers.addToSchema 'trades', Mpf.Schemas.createdAt

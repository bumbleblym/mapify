Mpf.CollectionHelpers.createSchema 'users',
  username:
    type: String
    regEx: /^[a-zA-Z0-9_]{4,16}$/

  emails:
    type: [Object]
    blackbox: true

  profile:
    type: Object
    
  "profile.phone":
    type: String

  services:
    type: Object
    blackbox: true

  status:
    type: Object
    optional: true
    blackbox: true

  createdAt:
    type: Date
    denyUpdate: true

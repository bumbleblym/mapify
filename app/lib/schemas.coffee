_.each [
  'users'
  'locations'
  'games'
  'inventory'
  'wishlist'
  'trades'
  'comments'
  'notifications'
], (collectionName) -> Mpf.CollectionHelpers.attachSchema collectionName

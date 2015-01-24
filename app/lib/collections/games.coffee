_.each [
  'games'
  'inventory'
  'wishlist'
  'trades'
], (collectionName) -> Mpf.CollectionHelpers.attachSchema collectionName

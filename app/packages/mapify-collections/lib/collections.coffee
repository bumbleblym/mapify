# Create collections namespace
collections = Mpf.helpers.createNamespace 'Collections'

# Create collection helpers namespace
collectionHelpers = Mpf.helpers.createNamespace 'CollectionHelpers',
  createCollection: (name, options) ->
    if name of collections
      throw new Error "Collection already exists: #{name}"

    collections[name] = new Mongo.Collection name, options

  attachSchema: (name) ->
    if name !of collections
      throw new Error "No such collection: #{name}"

    if name !of Mpf.Schemas
      throw new Error "No such schema: #{name}"

    collections[name].attachSchema Mpf.Schemas[name]

# Mirror schema helpers
_.each (_.keys Mpf.SchemaHelpers), (helperName) ->
  collectionHelpers[helperName] = Mpf.SchemaHelpers[helperName]

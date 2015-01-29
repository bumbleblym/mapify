# Create schemas namespace
schemas = Mpf.helpers.createNamespace 'Schemas'

# Create schema helpers namespace
schemaHelpers = Mpf.helpers.createNamespace 'SchemaHelpers',
  createSchema: (name, schemaObj) ->
    if name of schemas
      throw new Error "Schema already exists: #{name}"

    schemas[name] = new SimpleSchema schemaObj

  addToSchema: (name, schemaObj, options) ->
    if name !of schemas
      throw new Error "No such schema: #{name}"

    unless options?.overwrite == true
      oldProps = @getSchemaProperties name
      newProps = _.keys schemaObj
      dupProps = _.intersection oldProps, newProps
      if dupProps.length > 0
        throw new Error "#{name} schema already has properties: #{dupProps}"

    schemas[name] = new SimpleSchema [schemas[name], schemaObj]

  getSchema: (name) ->
    if name !of schemas
      throw new Error "No such schema: #{name}"

    return schemas[name].schema()

  getSchemaProperties: (name) ->
    if name !of schemas
      throw new Error "No such schema: #{name}"

    return _.keys @getSchema name

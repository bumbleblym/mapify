# Add SimpleSchema validation error messages
SimpleSchema.messages
  sameIds: '[label] cannot be the same as another id field'

# Define sub-schemas
Mpf.CollectionHelpers.createSchema 'createdAt',
  createdAt:
    type: Date
    denyUpdate: true
    autoValue: ->
      if @isInsert
        return new Date
      else if @isUpsert
        return $setonInsert: new Date
      else
        @unset()

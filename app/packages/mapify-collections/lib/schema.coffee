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

Mpf.SchemaHelpers.createSchema 'latLng',
  lat:
    type: Number
    min: -90
    max: 90
    decimal: true

  lng:
    type: Number
    min: -180
    max: 180
    decimal: true

Mpf.CollectionHelpers.createSchema 'locations',
  userId:
    type: SimpleSchema.RegEx.Id

  name:
    type: String

  latLng:
    type: Mpf.Schemas.latLng

  address:
    type: String

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

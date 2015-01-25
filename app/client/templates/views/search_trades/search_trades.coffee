Template.searchTrades.helpers
  mapOptions: ->
    if GoogleMaps.loaded()
      return {
        center: new google.maps.LatLng 1.3642357001706735, 103.81599426269531
        zoom: 11
      }

class Marker
  constructor: (trade, loc) ->
    @trades = {}
    @trades[trade._id] = trade

    @marker = new google.maps.Marker
      position: new google.maps.LatLng loc.latLng.lat, loc.latLng.lng
      map: GoogleMaps.maps.searchTrades.instance
      icon: 'http://maps.google.com/mapfiles/ms/icons/blue-dot.png'

  addTrade: (trade) ->
    @trades[trade._id] = trade

  tryRemoveTrade: (trade) ->
    if trade._id !of @trades
      return false

    delete @trades[trade._id]
    if _.isEmpty @trades
      @marker.setMap null
      return true
    return false



Template.searchTrades.rendered = ->
  markers = {}

  @autorun ->
    if GoogleMaps.loaded()
      Mpf.Collections.trades.find {}
        #userId:
        #  $ne: Meteor.userId()
      .observe
        added: (trade) ->
          tradeLocations = []

          _.each trade.locationIds, (locationId) ->
            if locationId of markers
              markers[locationId].addTrade trade
            else
              loc = Mpf.Collections.locations.findOne locationId
              markers[locationId] = new Marker(trade, loc)

        changed: (newTrade, oldTrade) ->
          @removed oldTrade
          @added newTrade

        removed: (trade) ->
          removed = []
          for locId of markers
            if markers[locId].tryRemoveTrade trade
              removed.push locId

          for locId in removed
            delete markers[locId]

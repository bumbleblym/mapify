Template.searchTrades.helpers
  mapOptions: ->
    if GoogleMaps.loaded()
      return {
        center: new google.maps.LatLng 1.3642357001706735, 103.81599426269531
        zoom: 11
      }

Template.locations.rendered = ->
  markers = {}

  @autorun ->
    if GoogleMaps.loaded()
      Mpf.Collections.trades.find
        userId:
          $ne: Meteor.userId()
      .observe
        added: (trade) ->
          tradeLocations = []

          _.each trade.locationIds, (locationId) ->
            loc = Mpf.Collections.locations.findOne locationId

            marker = new google.maps.Marker
              position: new google.maps.LatLng loc.latLng.lat, loc.latLng.lng
              map: GoogleMaps.maps.searchTrades.instance
              icon: 'http://maps.google.com/mapfiles/ms/icons/blue-dot.png'

            tradeLocations.push marker

          markers[trade._id] = tradeLocations

        changed: (newTrade, oldTrade) ->
          @removed oldTrade
          @added newTrade

        removed: (trade) ->
          tradeLocations = markers[trade._id]
          _.each tradeLocations, (marker) ->
            marker.setMap null

          delete markers[trade._id]

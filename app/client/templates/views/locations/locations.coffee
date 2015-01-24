Template.locations.helpers
  mapOptions: ->
    if GoogleMaps.loaded()
      return {
        center: new google.maps.LatLng 0, 0
        zoom: 4
      }

Template.locations.rendered = ->
  GoogleMaps.ready 'map', (map) ->
    google.maps.event.addListener map.instance, 'click', (event) ->
      marker = new google.maps.Marker
        position: event.latLng
        map: map.instance

      # Code for add location form
      $('#addLocationForm').css 'visibility', 'visible'

      $('#addLocationFormTopBar-closeButton').click ->
        $('#addLocationForm').css 'visibility', 'hidden'
        marker.setMap null

  markers = {}

  @autorun ->
    if GoogleMaps.loaded()
      Mpf.Collections.locations.find
        userId: Meteor.userId()
      .observe
        added: (loc) ->
          marker = new google.maps.Marker
            position: new google.maps.LatLng loc.latLng.lat, loc.latLng.lng
            map: GoogleMaps.maps.map.instance

          markers[loc._id] = marker

        changed: (newLoc, oldLoc) ->
          @removed oldLoc
          @added newLoc

        removed: (loc) ->
          markers[loc._id].setMap null
          delete markers[loc._id]


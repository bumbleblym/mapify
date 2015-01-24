Template.locations.helpers
  mapOptions: ->
    if GoogleMaps.loaded()
      return {
        center: new google.maps.LatLng 1.3642357001706735, 103.81599426269531
        zoom: 11
      }
  streetName: ->
    return Session.get 'address'
  locationName: ->
    return Session.get 'locationName'

Template.locations.rendered = ->
  globalMarker = null
  GoogleMaps.ready 'map', (map) ->
    marker = null
    geocoder = new google.maps.Geocoder();
    google.maps.event.addListener map.instance, 'click', (event) ->
      if marker?
        marker.setMap null
      marker = new google.maps.Marker
        position: event.latLng
        map: map.instance
        animation: google.maps.Animation.DROP,

      # Change color of selected marker
      marker.setIcon 'http://maps.google.com/mapfiles/ms/icons/green-dot.png'
      if previouslySelectedMarker?
        previouslySelectedMarker.setIcon 'http://maps.google.com/mapfiles/ms/icons/blue-dot.png'

      globalMarker = marker

      Session.set 'lat', marker.getPosition().lat()
      Session.set 'lng', marker.getPosition().lng()

      # Code to get streetname from latlng
      latlngObj =
        'latLng': marker.getPosition()
      geocoder.geocode latlngObj, (results, status) ->
        if status == google.maps.GeocoderStatus.OK
          if results[0]?
            Session.set 'address', results[0].formatted_address
          else
            Session.set 'address', 'No results found.'
        else
          alert "Geocoder failed due to: #{status}"

      # Code for add location form
      $('#addLocationForm').css 'visibility', 'visible'
      $("input[name='add-location']").val('')
      $('#remove-location-form').css 'visibility', 'hidden'

      $('#addLocationFormTopBar-closeButton').click ->
        $('#addLocationForm').css 'visibility', 'hidden'
        marker.setMap null

  markers = {}

  previouslySelectedMarker = null

  @autorun ->
    if GoogleMaps.loaded()
      Mpf.Collections.locations.find
        userId: Meteor.userId()
      .observe
        added: (loc) ->
          marker = new google.maps.Marker
            position: new google.maps.LatLng loc.latLng.lat, loc.latLng.lng
            map: GoogleMaps.maps.map.instance
            icon: 'http://maps.google.com/mapfiles/ms/icons/blue-dot.png'
          google.maps.event.addListener marker, 'click', ->
            $('#remove-location-form').css 'visibility', 'visible'
            $('#addLocationForm').css 'visibility', 'hidden'
            # Remove unsaved marker if it exists
            if globalMarker?
              globalMarker.setMap null

            selectedMarker = Mpf.Collections.locations.find
              userId: Meteor.userId()
              latLng:
                lat: marker.getPosition().lat()
                lng: marker.getPosition().lng()
            .fetch()

            # Change color of selected marker
            marker.setIcon 'http://maps.google.com/mapfiles/ms/icons/red-dot.png'
            previouslySelectedMarker = marker

            Session.set 'locationName', selectedMarker[0].name
            Session.set 'address', selectedMarker[0].address
            Session.set 'deleteMarkerId', selectedMarker[0]._id

            $('#remove-location-form-close-button').click ->
              $('#remove-location-form').css 'visibility', 'hidden'
              previouslySelectedMarker.setIcon 'http://maps.google.com/mapfiles/ms/icons/blue-dot.png'

          markers[loc._id] = marker

        changed: (newLoc, oldLoc) ->
          @removed oldLoc
          @added newLoc

        removed: (loc) ->
          markers[loc._id].setMap null
          delete markers[loc._id]

Template.locations.events
  'submit .add-location-submit': (event) ->
    Mpf.Collections.locations.insert
      userId: Meteor.userId()
      name: event.target[0].value
      latLng:
        lat: Session.get 'lat'
        lng: Session.get 'lng'
      address: Session.get 'address'
    $('#addLocationForm').css 'visibility', 'hidden'
    return false
  'submit .remove-location-submit': (event) ->
    Mpf.Collections.locations.remove
      _id: Session.get 'deleteMarkerId'
    $('#remove-location-form').css 'visibility', 'hidden'
    return false


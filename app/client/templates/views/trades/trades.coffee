Template.trades.helpers
  trades: ->
    return Mpf.Collections.trades.find
      userId: Meteor.userId()
  inventoryGame: ->
    return Mpf.Collections.inventory.find
      userId: Meteor.userId()
  wishlistGame: ->
    return Mpf.Collections.wishlist.find
      userId: Meteor.userId()
  myLocations: ->
    return Mpf.Collections.locations.find
      userId: Meteor.userId()
  displayHaveIds: ->
    haveIds = Session.get 'haveIds'
    if haveIds?
      return Mpf.Collections.inventory.find
        _id:
          $in: haveIds
    else
      haveIds = []
      return Mpf.Collections.inventory.find
        _id:
          $in: haveIds
  displayWantIds: ->
    wantIds = Session.get 'wantIds'
    if wantIds?
      return Mpf.Collections.wishlist.find
        _id:
          $in: wantIds
    else
      wantIds = []
      return Mpf.Collections.wishlist.find
        _id:
          $in: wantIds

  displayLocations: ->
    locations = Session.get 'locations'
    if locations?
      return Mpf.Collections.locations.find
        _id:
          $in: locations
    else
      locations = []
      return Mpf.Collections.locations.find
        _id:
          $in: locations


Template.trades.rendered = ->
  haveIds = []
  wantIds = []
  locations = []

  $('.add-have-game-buttom').click ->
    if (haveIds.indexOf $('#select-haveIds').val()) > -1
      return
    haveIds.push $('#select-haveIds').val()
    Session.set 'haveIds', haveIds

  $('.add-want-game-buttom').click ->
    if (wantIds.indexOf $('#select-wantIds').val()) > -1
      return
    wantIds.push $('#select-wantIds').val()
    Session.set 'wantIds', wantIds

  $('.add-location-buttom').click ->
    if (locations.indexOf $('#select-location-name').val()) > -1
      return
    locations.push $('#select-location-name').val()
    Session.set 'locations', locations

  $('.remove-have-game-buttom').click ->
    haveIds = [];
    Session.set 'haveIds', haveIds

  $('.remove-want-game-buttom').click ->
    wantIds = [];
    Session.set 'wantIds', wantIds

  $('.remove-location-buttom').click ->
    locations = [];
    Session.set 'locations', locations

AutoForm.hooks
  insertTradeForm:
    before:
      insert: (doc, template) ->
        doc.userId = Meteor.userId()
        doc.activeAt = new Date
        doc.haveIds = Session.get 'haveIds'
        doc.wantIds = Session.get 'wantIds'
        doc.locationIds = Session.get 'locations'
        Session.set 'haveIds', []
        Session.set 'wantIds', []
        Session.set 'locations', []

        $('#close-modal').click()

        return doc

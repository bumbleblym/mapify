Template.trades.helpers
  trades: ->
    return Mpf.Collections.trades.find
      userId: Meteor.userId()

  inventoryGames: ->
    return Mpf.Collections.inventory.find
      userId: Meteor.userId()

  wishlistGames: ->
    return Mpf.Collections.wishlist.find
      userId: Meteor.userId()

Template.trades.rendered = ->
  $('input[name="offer"]').on 'blur', ->
    if $(this).val() == ''
      $(this).val 0
    else if $(this).val() != 0
      $('input[name="want"]').val 0

  $('input[name="want"]').on 'blur', ->
    if $(this).val() == ''
      $(this).val 0
    else if $(this).val() != 0
      $('input[name="offer"]').val 0

Template.trade.helpers
  offeringGame: (id) ->
    return Mpf.Collections.inventory.findOne id

  requestingGame: (id) ->
    return Mpf.Collections.wishlist.findOne id

AutoForm.hooks
  insertTradeForm:
    before:
      insert: (doc, template) ->
        doc.userId = Meteor.userId()
        doc.activeAt = new Date

        doc.haveIds = []
        doc.wantIds = []

        $('.inventory-game').each ->
          if $(this).is(':checked')
            doc.haveIds.push $(this).val()

        $('.wishlist-game').each ->
          if $(this).is(':checked')
            doc.wantIds.push $(this).val()

        console.log doc
        return doc

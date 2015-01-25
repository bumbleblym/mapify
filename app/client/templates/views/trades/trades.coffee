Template.trades.helpers
  trades: ->
    return Mpf.Collections.trades.find
      userId: Meteor.userId()

Template.trade.helpers
  offeringGame: (id) ->
    return Mpf.Collections.inventory.findOne id

  requestingGame: (id) ->
    return Mpf.Collections.wishlist.findOne id

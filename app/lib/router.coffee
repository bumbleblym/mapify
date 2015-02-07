Router.configure
  layoutTemplate: 'layout'

Router.route '/', ->
  @render 'home'
,
  name: 'home'
  title: 'Home'

Router.route 'locations',
  title: 'Locations'

Router.route 'inventory',
  title: 'Inventory'

Router.route 'wishlist',
  title: 'Wishlist'

Router.route 'trades',
  title: 'My Trades'

# XXX limit trades
Router.route 'nearby-trades', ->
  @render 'nearbyTrades'
,
  name: 'nearbyTrades'
  title: 'Nearby Trades'
  waitOn: ->
    return Meteor.subscribe 'trades'

Router.onBeforeAction AccountsTemplates.ensureSignedIn,
  except: ['home', 'atSignIn', 'atSignUp', 'atForgotPassword', 'nearbyTrades']

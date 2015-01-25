IronRouterProgress.configure
  enabled : true

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
Router.route 'search-trades', ->
  @render 'searchTrades'
,
  name: 'searchTrades'
  title: 'Search Trades'
  waitOn: ->
    return Meteor.subscribe 'trades'

Router.onBeforeAction ->
  GoogleMaps.load()
  @next()
,
  only: ['locations', 'searchTrades']

Router.onBeforeAction AccountsTemplates.ensureSignedIn,
  except: ['home', 'atSignIn', 'atSignUp', 'atForgotPassword', 'searchTrades']

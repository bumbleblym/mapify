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
  title: 'Trades'

Router.onBeforeAction ->
  GoogleMaps.load()
  @next()
,
  only: ['locations']

Router.onBeforeAction AccountsTemplates.ensureSignedIn,
  except: ['home', 'atSignIn', 'atSignUp', 'atForgotPassword']

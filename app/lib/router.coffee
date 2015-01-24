Router.configure
  layoutTemplate: 'layout'

Router.route '/', ->
  @render 'home'
,
  name: 'home'
  title: 'Home'

Router.route 'locations',
  title: 'Locations'

Router.onBeforeAction ->
  GoogleMaps.load()
  @next()
,
  only: ['locations']

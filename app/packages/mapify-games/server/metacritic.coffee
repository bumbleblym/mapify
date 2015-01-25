# Create games namespace
mashapeKey = Meteor.settings.mashapeKey

Mpf.Games.lookupAndUpdateDatabase = (name) ->
  queryGames name, (error, result) ->
    if error?
      console.log "Failed to retrieve data from Mashape"
      return
    data = JSON.parse result.content
    games = {}

    for game in data.results
      platform = translatePlatform[game.platform]
      if not platform?
        continue

      if game.name of games
        if platform in games[game.name]
          games[game.name].push platform
      else
        games[game.name] = [platform]

    for name of games
      addToDb name, games[name]


translatePlatform =
  PS3: 'PS3'
  X360: 'Xbox 360'
  XONE: 'Xbox One'
  PS4: 'PS4'
  WIIU: 'Wii-U'
  PC: 'PC'
  XBOX: 'Xbox'
  GBA: 'GameBoy Advance'
  DS: 'DS'
  '3DS': '3DS'
  WII: 'Wii'
  N64: 'N64'
  GC: 'GameCube'
  PS2: 'PS2'
  PS1: 'PS1'
  VITA: 'PS Vita'
  PSP: 'PSP'
  DC: 'Dreamcast'


queryGames = (name, cb) ->
  url = 'https://byroredux-metacritic.p.mashape.com/search/game'
  options =
    params:
      max_pages: 1
      platform: 0
      retry: 0
      title: name

    headers:
      'X-Mashape-Key': mashapeKey
      'Content-Type': 'application/x-www-form-urlencoded'
      Accept: 'application/json'

  # XXX HTTP is not loaded. Thus added http package dependency.
  result = HTTP.post url, options, (error, result) ->
    cb error, result


addToDb = (name, platforms) ->
  game = Mpf.Collections.games.findOne
    title: name
  ,
    _id: true
    platforms: true
    unverifiedPlatforms: true

  if game?
    newUnverified = _.difference game.unverifiedPlatforms, platforms
    newVerified = _.union game.platforms, platforms
    Mpf.Collections.games.update game._id,
      $set:
        platforms: newVerified
        unverifiedPlatforms: newUnverified
        verified: true
  else
    Mpf.Collections.games.insert
      title: name
      platforms: platforms
      verified: true

# will always include locationIds as a field.
# If trade has multiple locationIds, only returns those within the radius.
# radius is in km
###
# returns two objects
locations: object
locId ->
{
  latlng: {
    lat: Number,
    lng: Number
  },
  trades: [object]
}
trades: array
###
Mpf.Games.searchTrades = (lat, lng, radius, criteria, projection) ->
  projection.locationIds = true
  trades = (Mpf.Collections.trades.find criteria, projection).fetch()
  #console.log trades
  selectedTrades = []
  selectedLocs = []

  for trade in trades
    validLocs = []
    latLngs = []

    for locId in trade.locationIds
      location = Mpf.Collections.locations.findOne
        _id: locId
      ,
        latLng: true

      #console.log computeDistance location.latLng, lat, lng
      if (computeDistance location.latLng, lat, lng) < radius
        validLocs.push locId
        if locId in selectedLocs
          selectedLocs[locId].trades.push trade
        else
          obj =
            latlng: location.latLng
            trades: [trade]
          selectedLocs[locId] = obj


    if validLocs.length >= 1
      trade.locationIds = validLocs
      selectedTrades.push trade

  retVal =
    locations: selectedLocs
    trades: selectedTrades
  return retVal


toRadians = (x) -> 3.141592/180*x


computeDistance = (latLngA, latB, lngB) ->
  latA = latLngA.lat
  lngA = latLngA.lng

  R = 6371; # km
  f1 = toRadians(latA);
  f2 = toRadians(latB);
  df = toRadians(latB-latA);
  dl = toRadians(lngB-lngA);

  a = Math.sin(df/2) * Math.sin(df/2) +
          Math.cos(f1) * Math.cos(f2) *
          Math.sin(dl/2) * Math.sin(dl/2);
  c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
  return R * c;

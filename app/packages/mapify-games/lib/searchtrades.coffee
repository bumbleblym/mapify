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
  trades = Mpf.Collections.games.find criteria, projection
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


computeDistance = (latLngA, latB, lngB) ->
  latA = latLngA.lat
  lngA = latLngA.lng

  R = 6371; # km
  f1 = lat1.toRadians();
  f2 = lat2.toRadians();
  df = (lat2-lat1).toRadians();
  dl = (lon2-lon1).toRadians();

  a = Math.sin(df/2) * Math.sin(df/2) +
          Math.cos(f1) * Math.cos(f2) *
          Math.sin(dl/2) * Math.sin(dl/2);
  c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
  return R * c;

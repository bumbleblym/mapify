# XXX Deny removal of locations that are part of a trade
Mpf.Collections.locations.permit ['insert', 'update']
.ifOwnsDoc().apply()

Mpf.Collections.locations.permit ['remove']
.ifOwnsDoc().locationPartOfTrade().apply()

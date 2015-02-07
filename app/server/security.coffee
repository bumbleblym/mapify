Mpf.Collections.locations.permit ['insert', 'update']
.ifOwnsDoc().apply()

Mpf.Collections.locations.permit ['remove']
.ifOwnsDoc().isLocationPartOfTrade().apply()


Mpf.Collections.inventory.permit ['insert', 'update']
.ifOwnsDoc().apply()

Mpf.Collections.inventory.permit ['remove']
.ifOwnsDoc().isInventoryPartOfTrade().apply()

Mpf.Collections.wishlist.permit ['insert', 'update']
.ifOwnsDoc().apply()

Mpf.Collections.wishlist.permit ['remove']
.ifOwnsDoc().isWishlistPartOfTrade().apply()

Mpf.Collections.trades.permit ['update', 'remove']
.ifOwnsDoc().apply()

Mpf.Collections.trades.permit ['insert']
.ifOwnsDoc().isValidTradePage().apply()

Mpf.Collections.comments.permit ['insert', 'update', 'remove']
.ifOwnsDoc().apply()

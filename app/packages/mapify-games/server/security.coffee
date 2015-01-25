# XXX Deny removal of inventory / wishlist items that are part of a trade
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

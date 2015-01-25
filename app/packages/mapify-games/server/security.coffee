# XXX Deny removal of inventory / wishlist items that are part of a trade
Mpf.Collections.inventory.permit ['insert', 'update']
.ifOwnsDoc().apply()

Mpf.Collections.inventory.permit ['remove']
.ifOwnsDoc().inventoryPartOfTrade().apply()


Mpf.Collections.wishlist.permit ['insert', 'update']
.ifOwnsDoc().apply()

Mpf.Collections.wishlist.permit ['remove']
.ifOwnsDoc().wishlistPartOfTrade().apply()


Mpf.Collections.trades.permit ['insert', 'update', 'remove']
.ifOwnsDoc().apply()

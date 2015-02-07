Package.describe({
  summary: 'mapify games package'
});

Package.onUse(function(api) {
  api.use([
    'mapify-accounts',
    'http@1.0.10'
  ]);

  api.imply([
    'mapify-accounts'
  ]);

  api.addFiles([
    'lib/platforms.coffee',
    'lib/games.coffee',
    'lib/inventory.coffee',
    'lib/wishlist.coffee',
    'lib/trades.coffee',
    'lib/namespace.coffee',
    'lib/searchtrades.coffee'
  ]);

  api.addFiles([
    'server/metacritic.coffee',
    'server/hooks.coffee',
    'server/security.coffee'
  ], 'server');
});

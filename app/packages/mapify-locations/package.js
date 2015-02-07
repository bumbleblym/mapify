Package.describe({
  summary: 'mapify locations package'
});

Package.onUse(function(api) {
  api.use([
    'mapify-accounts'
  ]);

  api.imply([
    'mapify-accounts'
  ]);

  api.addFiles([
    'lib/locations.coffee'
  ]);
});

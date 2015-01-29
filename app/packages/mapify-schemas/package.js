Package.describe({
  summary: 'mapify schemas package'
});

Package.onUse(function(api) {
  api.use([
    'mapify-base',
    'aldeed:simple-schema@1.3.0'
  ]);

  api.imply([
    'mapify-base',
    'aldeed:simple-schema'
  ]);

  api.addFiles([
    'lib/schemas.coffee'
  ]);
});

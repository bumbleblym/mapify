Package.describe({
  summary: 'mapify accounts ui package'
});

Package.onUse(function(api) {
  api.use([
    'mapify-accounts',
    'mapify-webapp',
    'useraccounts:bootstrap@1.6.1'
  ]);

  api.imply([
    'mapify-accounts',
    'mapify-webapp',
    'useraccounts:bootstrap'
  ]);

  api.addFiles([
    'lib/config.coffee',
    'lib/fields.coffee',
    'lib/routes.coffee'
  ]);
});

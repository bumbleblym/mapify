Package.describe({
  summary: 'mapify accounts package'
});

Package.onUse(function(api) {
  api.use([
    'mapify-collections',
    'accounts-password@1.0.6'
  ]);

  api.imply([
    'mapify-collections',
    'accounts-password',
    'mizzao:user-status@0.6.3'
  ]);

  api.addFiles([
    'lib/users.coffee'
  ]);

  api.addFiles([
    'server/security.coffee'
  ], 'server');
});

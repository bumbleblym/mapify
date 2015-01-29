Package.describe({
  summary: 'mapify base package'
});

Package.onUse(function(api) {
  api.use([
    'meteor-platform@1.2.1',
    'coffeescript@1.0.5'
  ]);

  api.imply([
    'meteor-platform',
    'coffeescript'
  ]);

  api.export([
    'Mpf'
  ]);

  api.addFiles([
    'lib/namespace.coffee'
  ]);
});

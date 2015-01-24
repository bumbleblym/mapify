Package.describe({
    summary: 'mapify games package'
});

Package.onUse(function(api) {
    api.use([
        'mapify-accounts'
    ]);

    api.imply([
        'mapify-accounts'
    ]);

    api.addFiles([
        'lib/games.coffee',
        'lib/schema.coffee'
    ]);

    api.addFiles([
        'server/hooks.coffee',
        'server/security.coffee'
    ], 'server');
});

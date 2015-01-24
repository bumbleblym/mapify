Package.describe({
    summary: 'mapify accounts package'
});

Package.onUse(function(api) {
    api.use([
        'mapify-collections'
    ]);

    api.imply([
        'mapify-collections'
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

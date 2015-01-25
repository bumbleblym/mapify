Package.describe({
    summary: 'mapify accounts package'
});

Package.onUse(function(api) {
    api.use([
        'mapify-collections',
        'http@1.0.10'
    ]);

    api.imply([
        'mapify-collections'
    ]);

    api.addFiles([
        'lib/namespace.coffee',
        'lib/games.coffee',
        'lib/schema.coffee',
        'lib/searchtrades.coffee'
    ]);

    api.addFiles([
        'server/metacritic.coffee',
        'server/hooks.coffee',
        'server/security.coffee'
    ], 'server');
});

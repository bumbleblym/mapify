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
        'lib/games.coffee',
        'lib/schema.coffee'
    ]);

    api.addFiles([
        'server/metacritic.coffee',
        'server/hooks.coffee',
        'server/security.coffee'
    ], 'server');
});

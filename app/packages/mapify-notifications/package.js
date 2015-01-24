Package.describe({
    summary: 'mapify notifications package'
});

Package.onUse(function(api) {
    api.use([
        'mapify-accounts'
    ]);

    api.imply([
        'mapify-accounts'
    ]);

    api.addFiles([
        'lib/notifications.coffee',
        'lib/schema.coffee'
    ]);
});

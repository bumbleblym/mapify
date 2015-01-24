Package.describe({
    summary: 'mapify collections package'
});

Package.onUse(function(api) {
    api.use([
        'mapify-schemas',
        'aldeed:collection2@2.3.1'
    ]);

    api.imply([
        'mapify-schemas',
        'aldeed:collection2',
        'matb33:collection-hooks@0.7.9',
        'ongoworks:security@1.0.1'
    ]);

    api.addFiles([
        'lib/collections.coffee',
        'lib/schema.coffee'
    ]);
});

Package.describe({
    summary: 'mapify webapp package'
});

Package.onUse(function(api) {
    api.use([
        'mapify-base',
        'iron:router@1.0.7'
    ]);

    api.imply([
        'mapify-base',
        'iron:router',
        'aldeed:autoform@4.2.2',
        'less@1.0.12',
        'twbs:bootstrap@3.3.1_2',
        'fortawesome:fontawesome@4.2.0_2'
    ]);

    api.addFiles([
        'lib/router.coffee'
    ]);
});

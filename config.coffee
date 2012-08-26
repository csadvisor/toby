exports.config =
  # See docs at http://brunch.readthedocs.org/en/latest/config.html.
  files:
    javascripts:
      defaultExtension: 'coffee'
      joinTo:
        'javascripts/app.js': /^app/
        'javascripts/vendor/spine.js': /^vendor\/scripts\/spine/
        'javascripts/vendor/common.js': /^vendor\/scripts\/common/
      order:
        before: [
          'vendor/scripts/common/underscore-1.3.3.js'
          'vendor/scripts/spine/spine.js'
          'vendor/scripts/spine/lib/ajax.js'
          'vendor/scripts/spine/lib/local.js'
          'vendor/scripts/spine/lib/manager.js'
          'vendor/scripts/spine/lib/relation.js'
          'vendor/scripts/spine/lib/route.js'
          'vendor/scripts/spine/lib/tmpl.js'
          'vendor/scripts/common/jquery-1.7.2.js' # before bootstrap scripts
        ]
        after: [
          'vendor/scripts/common/bootstrap-popover.js'
        ]

    stylesheets:
      defaultExtension: 'less'
      joinTo: 'stylesheets/app.css'
      order:
        before: ['vendor/styles/bootstrap.css']
        after: ['app/styles/main.css']

    templates:
      defaultExtension: 'eco'
      joinTo: 'javascripts/app.js'

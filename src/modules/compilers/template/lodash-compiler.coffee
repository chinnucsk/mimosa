"use strict"

AbstractUnderscoreCompiler = require './underscore'

module.exports = class LodashCompiler extends AbstractUnderscoreCompiler

  clientLibrary: "lodash"
  libName: 'lodash'

  @prettyName        = "LoDash - http://lodash.com/docs#template"
  @defaultExtensions = ["tmpl", "lodash"]

  constructor: (config, @extensions) ->
    super(config)

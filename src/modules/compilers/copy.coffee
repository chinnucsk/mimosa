"use strict"

module.exports = class CopyCompiler

  constructor: (config, @extensions) ->

  registration: (config, register) ->
    register ['add','update','buildFile'], 'compile', @compile, @extensions

  compile: (config, options, next) ->
    hasFiles = options.files?.length > 0
    return next() unless hasFiles

    options.files.forEach (file) =>
      file.outputFileText = file.inputFileText

    next()
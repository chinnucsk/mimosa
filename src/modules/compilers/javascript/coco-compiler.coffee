"use strict"

coco = require 'coco'
_ = require 'lodash'

JSCompiler = require "./javascript"

module.exports = class CocoCompiler extends JSCompiler

  libName: 'coco'

  @prettyName        = "Coco - https://github.com/satyr/coco"
  @defaultExtensions = ["co", "coco"]

  constructor: (config, @extensions) ->
    @config = config.coco
    super()

  compile: (file, cb) ->
    try
      output = @compilerLib.compile file.inputFileText, _.extend {}, @config
    catch err
      error = err
    cb(error, output)
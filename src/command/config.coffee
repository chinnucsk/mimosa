path =   require 'path'
fs =     require 'fs'

logger = require 'logmimosa'
buildConfig = require '../util/config-builder'

copyConfig = (opts) ->
  if opts.debug
    logger.setDebug()
    process.env.DEBUG = true

  conf = buildConfig()

  currDefaultsPath = path.join path.resolve(''), "mimosa-config-commented.coffee"
  logger.debug "Writing config defaults file to #{currDefaultsPath}"
  defaultsConf = """

                 # THE FOLLOWING IS A COMMENTED VERSION OF THE mimosa-config.coffee WITH
                 # ALL OF THE MOST RECENT DEFAULTS. THIS FILE IS MEANT FOR REFERENCE ONLY.

                 #{conf}
                 """
  fs.writeFileSync currDefaultsPath, defaultsConf, 'ascii'
  logger.success "Copied mimosa-config-commented.coffee into current directory."

  mimosaConfigPath = path.join path.resolve(''), "mimosa-config.coffee"
  if fs.existsSync mimosaConfigPath
    logger.info "Not writing mimosa-config.coffee file as one exists already."
  else
    logger.debug "Writing config file to #{mimosaConfigPath}"
    fs.writeFileSync mimosaConfigPath, conf, 'ascii'
    logger.success "Copied mimosa-config.coffee into current directory."

  process.exit 0

register = (program, callback) ->
  program
    .command('config')
    .option("-D, --debug", "run in debug mode")
    .description("copy the default Mimosa config into the current folder")
    .action(callback)
    .on '--help', =>
      logger.green('  The config command will copy the default Mimosa config to the current directory.')
      logger.green('  And also copy a defaults file to keep as reference should you desire to alter and.')
      logger.green('  shrink the mimosa-config.')
      logger.blue( '\n    $ mimosa config\n')


module.exports = (program) ->
  register(program, copyConfig)
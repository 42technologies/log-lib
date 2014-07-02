
_                = require 'lodash'
Bunyan           = require 'bunyan'
bunyanLogentries = require 'bunyan-logentries'


CONFIG =
    mode: process.env.NODE_ENV or 'development'
    logentries:
        token: process.env.logentries__token or 'c7f91048-fc27-43c0-836b-7e5c74e2bccd'


BunyanLogentriesStream = (config) ->
    throw new Error("Missing required `config.token` property") if not config.token
    bunyanLogentries.createStream {token:config.token},
        excludes: {v:true, pid:true, level:true, time:true}


module.exports = (options, logentries) ->
    throw new Error("Missing required `options.name` property") if not options.name

    log = new Bunyan(options)
    log = log.child(mode:CONFIG.mode)

    logentriesStream = do ->
        logentries = _.extend {}, CONFIG.logentries, logentries
        try return new BunyanLogentriesStream(logentries)

    if logentriesStream
        log.info {logentries}, "attaching logentries stream to logger"
        log = log.child streams: [
            type: 'raw'
            stream: logentriesStream
            level: 'debug'
        ]

    return log

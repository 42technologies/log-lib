
# Log Lib

This is a wrapper around bunyan, with some predefined streams.

Use this as your parent logger for great justice.

```coffeescript
Logger = require 'log-lib'
logger = new Logger(name:'sup')
logger.info("for great justice")
```


### Logentries Integration

This logger uses a Logentries stream. In order for it to work,
you must define a `logentries__token` environment variable.

Alternatively, you can pass a `{token:'<token>'}` object as
the second argument of the `Logger` constructor.

```coffeescript
logger = new Logger({name:'sup'}, {token:'<token>'})
```

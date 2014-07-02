
# Log Lib

This is a wrapper around bunyan, with some predefined streams.

Use this as your parent logger for great justice.

```coffeescript
Logger = require 'log-lib'
logger = new Logger(name:'sup')
logger.info("for great justice")
```
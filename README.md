# LoggingExtrasCompose

[![Build Status](https://travis-ci.org/tanmaykm/LoggingExtrasCompose.jl.png)](https://travis-ci.org/tanmaykm/LoggingExtrasCompose.jl) 
[![Coverage Status](https://coveralls.io/repos/github/tanmaykm/LoggingExtrasCompose.jl/badge.svg?branch=master)](https://coveralls.io/github/tanmaykm/LoggingExtrasCompose.jl?branch=master)

Provides plugins to allow logger provided by [LoggingExtras](https://github.com/oxinabox/LoggingExtras.jl) to be used with [LogCompose](https://github.com/tanmaykm/LogCompose.jl).

The following logger types can be composed with this package:
- LoggingExtras.TeeLogger
- LoggingExtras.FileLogger

Example configurations:

```toml
[loggers.file]
type = "Logging.SimpleLogger"
# min_level = "Debug"           # Debug, Info (default) or Error
stream = "testapp.log"          # stdout (default), stderr or a filepath

[loggers.debugfile]
type = "Logging.SimpleLogger"
min_level = "Debug"
stream = "debug.log"

[loggers.testapp]
type = "LoggingExtras.TeeLogger"
destinations = ["file", "debugfile"]
```

Check documentation of [LoggingExtras](https://github.com/oxinabox/LoggingExtras.jl) for more details about parameter values.

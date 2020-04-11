# LoggingExtrasCompose

[![Build Status](https://travis-ci.org/tanmaykm/LoggingExtrasCompose.jl.png)](https://travis-ci.org/tanmaykm/LoggingExtrasCompose.jl) 
[![Coverage Status](https://coveralls.io/repos/github/tanmaykm/LoggingExtrasCompose.jl/badge.svg?branch=master)](https://coveralls.io/github/tanmaykm/LoggingExtrasCompose.jl?branch=master)

Provides plugins to allow logger provided by [LoggingExtras](https://github.com/oxinabox/LoggingExtras.jl) to be used with [LogCompose](https://github.com/tanmaykm/LogCompose.jl).

The following logger types can be composed with this package:
- LoggingExtras.TeeLogger
- LoggingExtras.FileLogger

Example configurations:

```toml
[loggers.file1]
type = "LoggingExtras.FileLogger"
filename = "testapp1.log"
append = true                   # file open mode (default: false)
flush = true                    # flush after logging (default: true)
    
[loggers.file2]
type = "LoggingExtras.FileLogger"
filename = "testapp2.log"
append = true
flush = true

[loggers.tee]
type = "LoggingExtras.TeeLogger"
destinations = ["file1", "file2"]
```

Check documentation of [LoggingExtras](https://github.com/oxinabox/LoggingExtras.jl) for more details about parameter values.

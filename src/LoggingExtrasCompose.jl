module LoggingExtrasCompose

using LoggingExtras, LogCompose
import LogCompose: logcompose, log_min_level, log_assumed_level

function logcompose(::Type{LoggingExtras.TeeLogger}, config::Dict{String,Any}, logger_config::Dict{String,Any})
    destinations = [LogCompose.logger(config, dest) for dest in logger_config["destinations"]]
    LoggingExtras.TeeLogger(destinations...)
end

function logcompose(::Type{LoggingExtras.FileLogger}, config::Dict{String,Any}, logger_config::Dict{String,Any})
    filename = logger_config["filename"]
    append = get(logger_config, "append", false)
    flush = get(logger_config, "flush", true)

    LoggingExtras.FileLogger(filename; append=append, always_flush=flush)
end

end # module

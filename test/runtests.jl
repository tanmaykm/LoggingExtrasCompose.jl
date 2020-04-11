using LogCompose, Test, Logging, LoggingExtras, LoggingExtrasCompose

function test()
    config = joinpath(@__DIR__, "testapp.toml")
    file1 = "testapp1.log"
    file2 = "testapp2.log"
    rm(file1; force=true)
    rm(file2; force=true)

    let logger = LogCompose.logger(config, "file1"; section="loggers")
        with_logger(logger) do
            @info("testfile1")
        end
    end

    let logger = LogCompose.logger(config, "file2"; section="loggers")
        with_logger(logger) do
            @info("testfile2")
        end
    end

    let logger = LogCompose.logger(config, "tee"; section="loggers")
        with_logger(logger) do
            @info("testtee")
        end
    end

    @test isfile(file1)
    @test isfile(file2)

    log_file_contents = readlines(file1)
    @test findfirst("testfile1", log_file_contents[1]) !== nothing
    @test findfirst("testtee", log_file_contents[3]) !== nothing

    log_file_contents = readlines(file2)
    @test findfirst("testfile2", log_file_contents[1]) !== nothing
    @test findfirst("testtee", log_file_contents[3]) !== nothing

    try
        rm(file1; force=true)
        rm(file2; force=true)
    catch ex
        # ignore errors due to file handles being open on Windows
    end
end

test()

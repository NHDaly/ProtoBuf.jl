using Test

include("testtypevers.jl")
include("testutilapi.jl")
include("testwellknown.jl")
include("testcodec.jl")
include("services/testsvc.jl")
include("testprotoc.jl")

#include("thread-safety.jl")
thread_safety_file = joinpath(@__DIR__, "thread-safety.jl")
run(`$(Base.julia_cmd()) -t20 $thread_safety_file`)

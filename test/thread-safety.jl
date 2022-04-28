using ProtoBuf
using Test
using ProtoBuf: call_method, write_bytes, read_bytes
using Base.Threads: @spawn

include("services/testsvc_pb.jl")

function foo(N)
    ch = Channel(Inf)
    @sync for i in 1:N
        @spawn begin
            resp = BinaryOpReq()
            resp.i1 = i
            resp.i2 = i+1
            put!(ch, resp)
        end
    end
end

@time foo(10)
@time foo(1_000)
@time foo(100_000)
#@time foo(1_000_000)





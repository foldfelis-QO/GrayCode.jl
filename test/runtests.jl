using GrayCode
using Test

@testset "GrayCode.jl" begin
    @test bitstring.(gen(Gray{UInt8, 3})) == [
        "00000000",
        "00000001",
        "00000011",
        "00000010",
        "00000110",
        "00000111",
        "00000101",
        "00000100"
    ]
end

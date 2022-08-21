using GrayCode
using InteractiveUtils
using Test

const Us = [UInt128, UInt16, UInt32, UInt64, UInt8]
const Is = [Int128, Int16, Int32, Int64, Int8]
const Gs = [Gray128, Gray16, Gray32, Gray64, Gray8]

@testset "GrayCode.jl" begin
    for (U, I, G) in zip(Us, Is, Gs)
        for i in typemin(UInt8):typemax(UInt8)
            @test Integer(Gray(U(i))) == U(i)
            (reinterpret(Int8, i) < 0) || @test Integer(Gray(I(i))) == U(i)
        end
    end
end

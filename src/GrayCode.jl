module GrayCode

export Gray, Gray8, Gray16, Gray32, Gray64, Gray128

abstract type Gray <: Unsigned end

primitive type Gray8 <: Gray 8 end
primitive type Gray16 <: Gray 16 end
primitive type Gray32 <: Gray 32 end
primitive type Gray64 <: Gray 64 end
primitive type Gray128 <: Gray 128 end

@inline _gray(x) = x ⊻ (x >> 1)
@inline Gray8(x::UInt8) = reinterpret(Gray8, _gray(x))
@inline Gray16(x::UInt16) = reinterpret(Gray16, _gray(x))
@inline Gray32(x::UInt32) = reinterpret(Gray32, _gray(x))
@inline Gray64(x::UInt64) = reinterpret(Gray64, _gray(x))
@inline Gray128(x::UInt128) = reinterpret(Gray128, _gray(x))

@inline reinterpret2Int(g::Gray8) = reinterpret(UInt8, g)
@inline reinterpret2Int(g::Gray16) = reinterpret(UInt16, g)
@inline reinterpret2Int(g::Gray32) = reinterpret(UInt32, g)
@inline reinterpret2Int(g::Gray64) = reinterpret(UInt64, g)
@inline reinterpret2Int(g::Gray128) = reinterpret(UInt128, g)
@inline function _int(g::T) where {T<:Gray}
    x = reinterpret2Int(g)
    mask = x >> 1
    while mask > 0
        x ⊻= mask
        mask >>= 1
    end

    return x
end

Base.show(io::IO, g::Gray) = print(io, "$(typeof(g))($(_int(g)))")

@inline Gray(x::UInt8) = Gray8(x)
@inline Gray(x::UInt16) = Gray16(x)
@inline Gray(x::UInt32) = Gray32(x)
@inline Gray(x::UInt64) = Gray64(x)
@inline Gray(x::UInt128) = Gray128(x)
@inline Gray(x::Integer) = Gray(unsigned(x))

end

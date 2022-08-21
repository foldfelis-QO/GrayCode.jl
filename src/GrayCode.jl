module GrayCode

export Gray, gen

struct Gray{T<:Integer, N} end

function gen_gray_codes(T, n)
    (n == 1) && (return T[0, 1])

    gray_codes = gen(Gray{T, n-1})
    bitmask = one(T) << (n - 1)
    for gray_code in reverse(gray_codes)
        push!(gray_codes, bitmask | gray_code)
    end

    return gray_codes
end

gen(::Type{Gray{T, N}}) where {T, N} = gen_gray_codes(T, N)

end

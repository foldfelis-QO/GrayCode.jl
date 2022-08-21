# GrayCode

Primitive types of Gray codes introduced by Frank Gray

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://foldfelis.github.io/GrayCode.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://foldfelis.github.io/GrayCode.jl/dev/)
[![Build Status](https://github.com/foldfelis/GrayCode.jl/actions/workflows/CI.yml/badge.svg?branch=master)](https://github.com/foldfelis/GrayCode.jl/actions/workflows/CI.yml?query=branch%3Amaster)
[![Coverage](https://codecov.io/gh/foldfelis/GrayCode.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/foldfelis/GrayCode.jl)

## Quick start

The package can be installed with the Julia package manager. From the Julia REPL, type ] to enter the Pkg REPL mode and run:

```julia
pkg> add GrayCode
```

## Usage

To use Gray code to represent integer:

```julia
julia> using GrayCode

julia> Gray8(5)
Gray8(5)

julia> Gray16(5)
Gray16(5)

julia> Gray32(5)
Gray32(5)

julia> Gray64(5)
Gray64(5)

julia> Gray128(5)
Gray128(5)

julia> Gray(5)
Gray64(5)
```

To convert Gray code to 2's complement representation:

```julia
julia> typeof(Integer(Gray8(5)))
UInt8

julia> Integer(Gray8(5))
0x05
```

## Bit pattern of Gray codes

```julia
julia> @. bitstring(Gray8(0:7))
8-element Vector{String}:
 "00000000"
 "00000001"
 "00000011"
 "00000010"
 "00000110"
 "00000111"
 "00000101"
 "00000100"
```

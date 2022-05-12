# submit
import Base: zero, one, abs, +, -, *, /, ^, ==, <, >, <=, >=

# Implement the gcd.
struct RationalNumber{T <: Real} <: Real
    a::T
    b::T
    RationalNumber(a::T, b::T) where T <: Real = begin 
        if iszero(b) 
            throw(ArgumentError("`b` must not be zero"))
        else
            # GCD
            m, n = a < b ? abs.((a, b)) : abs.((b, a))
            while m > 0
                m, n = n % m, m
            end
            b < 0 ? new{T}(-1*a/n, abs(b)/n) : new{T}(a/n, b/n)
        end
    end
end

RationalNumber(a::Real, b::Real) = RationalNumber(promote(a, b)...)
RationalNumber(a::Real) = RationalNumber(zero(a), a)

# JFK
zero(::RationalNumber{T}) where T <: Real = RationalNumber(one(T))
zero(::Type{RationalNumber{T}}) where T <: Real = RationalNumber(one(T))

one(::RationalNumber{T}) where T <: Real = RationalNumber(one(T), one(T))
one(::Type{RationalNumber{T}}) where T <: Real = RationalNumber(one(T), one(T))

# Arithmetic operations
+(x::RationalNumber, y::RationalNumber) = RationalNumber(x.a*y.b + x.b*y.a, x.b*y.b)
-(x::RationalNumber, y::RationalNumber) = RationalNumber(x.a*y.b - x.b*y.a, x.b*y.b)
*(x::RationalNumber, y::RationalNumber) = RationalNumber(x.a*y.a, x.b*y.b)
/(x::RationalNumber, y::RationalNumber) = RationalNumber(x.a*y.b, x.b*y.a)
^(r::RationalNumber, n::Integer) = n >= 1 ? RationalNumber(r.a^n, r.b^n) : RationalNumber(r.b^abs(n), r.a^abs(n))
^(r::RationalNumber, x::Real) = RationalNumber(r.a^x, r.b^x)
^(x::Real, r::RationalNumber) = x^(r.a/r.b)

# Other operations
abs(x::RationalNumber) = RationalNumber(abs(x.a), abs(x.b))

# 
numerator(x::RationalNumber) = x.a
denominator(x::RationalNumber) = x.b

# Comparisons
==(x::RationalNumber, y::RationalNumber) = x.a==y.a && x.b==y.b
==(x::RationalNumber, y::Real) = x.a == y*x.b
<(x::RationalNumber, y::RationalNumber) = x.a*y.b < y.a*x.b
<=(x::RationalNumber, y::RationalNumber) = x < y || x == y
<(x::RationalNumber, y::Real) = x.a < y*x.b
<=(x::RationalNumber, y::Real) = x < y || x == y
>(x::RationalNumber, y::RationalNumber) = x.a*y.b > y.a*x.b
>=(x::RationalNumber, y::RationalNumber) = x > y || x == y
>(x::RationalNumber, y::Real) = x.a > y*x.b
>=(x::RationalNumber, y::Real) = x > y || x == y

# 
function show(io::IO, x::RationalNumber)  
    print(io, "$(x.a)//$(x.b)")
end
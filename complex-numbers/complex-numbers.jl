# submit
import Base: +, -, *, /, abs, ==, ≈
struct ComplexNumber{T <: Real} <: Number
    x::T
    y::T
end
ComplexNumber(x::Real, y::Real) = ComplexNumber(promote(x,y)...)

# Comparisons
==(c1::ComplexNumber, c2::ComplexNumber) = c1.x == c2.x && c1.y == c2.y
≈(c1::ComplexNumber, c2::ComplexNumber) = 1 + c1.x ≈ 1 + c2.x && 1 + c1.y ≈ 1 + c2.y # same but zero is included.

# Addition
+(c1::ComplexNumber, c2::ComplexNumber) = ComplexNumber(c1.x + c2.x, c1.y + c2.y)
+(r::T, c::ComplexNumber) where T <: Real = ComplexNumber(c.x + r, c.y)

# Subtraction
-(c1::ComplexNumber, c2::ComplexNumber) = ComplexNumber(c1.x - c2.x, c1.y - c2.y)
-(r::T, c::ComplexNumber) where T <: Real = ComplexNumber(c.x - r, c.y)

# Mutliplication
*(c1::ComplexNumber, c2::ComplexNumber) = ComplexNumber(c1.x*c2.x - c1.y*c2.y, c1.x*c2.y + c2.x*c1.y)
*(r::T, c::ComplexNumber) where T <: Real = ComplexNumber(r*c.x, r*c.y)

# Division
/(c1::ComplexNumber, c2::ComplexNumber) = ComplexNumber((c1.x * c2.x + c1.y * c2.y)/(c2.x^2 + c2.y^2), (c1.y * c2.x - c1.x * c2.y)/(c2.x^2 + c2.y^2))
/(c::ComplexNumber, r::T) where T <: Real = ComplexNumber(c.x/r, c.y/r)
/(r::T, c::ComplexNumber) where T <: Real = ComplexNumber(r, zero(r))/c

# Others
abs(c::ComplexNumber) = sqrt(c.x^2 + c.y^2)
conj(c::ComplexNumber) = ComplexNumber(c.x, -c.y)
real(c::ComplexNumber) = c.x
imag(c::ComplexNumber) = c.y
exp(c::ComplexNumber) = ComplexNumber(Base.exp(c.x) * cos(c.y), Base.exp(c.x) * sin(c.y))

# Sugar
const jm = ComplexNumber(0, 1)

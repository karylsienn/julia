"Your optional docstring here"
function distance(a, b)
    if length(a) ≠ length(b)
        throw(ArgumentError( "Two strands should be of the same length!"))
    end
    sum([ x ≠ y for (x, y) in zip(a, b)  ])
end

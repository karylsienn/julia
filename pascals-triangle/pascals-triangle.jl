# submit
function next_row(previous_row)
    n = length(previous_row)
    if n == 0
        return [1]
    end
    new_row = zeros(Int64, n+1)
    init = 0
    for i ∈ 1:(Int(ceil((n+1)/2)))
        new_row[i] = previous_row[i] + init
        new_row[n+2-i] = previous_row[i] + init
        init = previous_row[i]
    end
    return new_row
end

function triangle(n)
    if n < 0
        throw(DomainError("`n` must be positivie"))
    elseif n == 0
        return []
    else 
        stack=[[] for _ in 1:n]
        previous_row = stack[1]
        for i ∈ 1:n
            stack[i] = next_row(previous_row)
            previous_row = stack[i]
        end
    end
    return stack 
end
function score(x, y)
    r = x^2 + y^2
    if r ≤ 1
        return 10
    elseif r ≤ 25
        return 5
    elseif r ≤ 100
        return 1
    else
        return 0
    end
end

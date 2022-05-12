"""
    ispangram(input)

Return `true` if `input` contains every alphabetic character (case insensitive).

"""
function ispangram(input)
    for i in 0:24
        occursin('a' + i, lowercase(input)) || return(false)
    end
    return(true)
end


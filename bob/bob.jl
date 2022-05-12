function bob2(stimulus)
    ts = strip(stimulus)
    if ts == ""
        return("Fine. Be that way!")
    end
    if (uppercase(ts) == ts) & occursin(r"[A-Z]+", ts)
        if ts[length(ts)]=='?'
            return("Calm down, I know what I'm doing!")
        end
        return("Whoa, chill out!")
    elseif ts[length(ts)]=='?'
        return("Sure.")
    end
    return("Whatever.")
end



"""This is cleverer bob idea. """ 
function bob(stimulus)
    responses = Dict(
        :question => "Sure.",
        :yelling  => "Whoa, chill out!",
        :question_yell => "Calm down, I know what I'm doing!",
        :silence => "Fine. Be that way!",
        :misc => "Whatever."
    )

    ts = strip(stimulus)

    # We are just making function so there is no evaluation included
    is_question() = endswith(ts, '?')
    is_yelling() =  occursin(r"[A-Z]", ts) && !occursin(r"[a-z]", ts)
    is_silence() = (match(r"\S", ts) === nothing)

    #  a && b evaluates only if a evaluates to true
    is_silence() && return(responses[:silence])
    is_yelling() && is_question() && return(responses[:question_yell])
    is_question() && return(responses[:question])
    is_yelling() && return(responses[:yelling])
    return(responses[:misc])
    
    
end






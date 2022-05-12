function encode(s)
    encoded = ""
    count = 1
    prev = ""
    
    for x in s
        x = string(x)
        if (prev==x) & !isempty(prev)
            count += 1
        else
            if count ≥ 2
                encoded*=string(count)*prev
            else
                encoded*=prev
            end
            count = 1
        end
        prev=x
    end
    if count ≥ 2
        encoded*=string(count)*prev
    else
        encoded*=prev
    end
    return(encoded)
end



function decode(s)
    decoded=""
    regex = r"([0-9]+)[A-Za-z\s]|(?<=[A-Za-z\s])[A-Za-z\s]|^[A-Za-z\s]"
    allmatches = collect(eachmatch(regex, s))
    for m in allmatches
        capt = m.captures[1]
        if capt === nothing
            decoded *= m.match
        else
            numcapt = parse(Int, capt)
            decoded *= repeat(m.match[end], numcapt)
        end
    end
    return(decoded)
    
end

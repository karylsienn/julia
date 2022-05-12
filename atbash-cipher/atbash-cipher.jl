function encode(input)
    lowerinput = lowercase(replace(input, r"[^\w0-9]" => ""))    
    mapped = map(c -> isletter(c) ? 'z' - Char(c) + 'a' : c, lowerinput)
    mapped = replace(mapped, r"(.{5})" => Base.SubstitutionString("\\1 "))
    return mapped[end] == ' ' ? mapped[1:end-1] : mapped
end

function decode(input)
    lowerinput = lowercase(replace(input, r"[^\w0-9]" => ""))
    map(c -> isletter(c) ? 'z' - Char(c) + 'a' : c, lowerinput)
end
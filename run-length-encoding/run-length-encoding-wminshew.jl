import IterTools

function encode(s::AbstractString)
    join([string(length(letter) > 1 ? length(letter) : "", first(letter))
          for letter in IterTools.groupby(identity, s)])
end

function decode(s::AbstractString)
    join([repeat(m[:letter], (isempty(m[:count]) ? 1 : parse(Int, m[:count])))
          for m in eachmatch(r"(?<count>\d*)(?<letter>\D)", s)])
end

# \d matches a digit,
# \D matches a character that is not a digit,
# * is zero or more times,
# ? is once or none

"""
    count_nucleotides(strand)

The frequency of each nucleotide within `strand` as a dictionary.

Invalid strands raise a `DomainError`.

"""
function count_nucleotides(strand)
    nucl = ['A', 'C', 'G', 'T']
    u = unique(strand)
    length(setdiff(u, nucl)) > 0 ?
        throw(DomainError(strand, "invalid nucleotides in strand")) :
        Dict(i => count(x -> x == i, strand) for i in nucl)
end


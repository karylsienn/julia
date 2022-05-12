function to_rna(dna)
    rd = Dict('G' => 'C', 'C' => 'G', 'T' => 'A', 'A' => 'U')
    u = unique(dna)
    length(setdiff(u, keys(rd))) > 0 ? throw(ErrorException("")) : join([rd[x] for x in dna])
end


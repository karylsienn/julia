function detect_anagrams(subject, candidates)
    sort_string(str) = lowercase(str) |> collect |> sort |> join
    sorted_subject = sort_string(subject)
    filter(candidate -> (lowercase(candidate) != lowercase(subject) &&
                         sort_string(candidate) == sorted_subject),
           candidates)
end

function binarysearch(arr, el; rev=false, by=identity, lt = <)
    
    l = 1
    r = length(arr)
    
    arr = rev ? reverse(arr) : arr
    
    while l <= r 
        i = Integer(floor((r+l)/2))
        if lt(by(el), by(arr[i]))
            r = i - 1
        elseif lt(by(arr[i]), by(el) ) 
            l = i + 1
        else
            l = r = i
            break
        end
    end
    
    return rev ? (length(arr)-r+1 : length(arr)-l+1) : (l:r)
    
end
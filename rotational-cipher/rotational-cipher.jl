# submit
function rotate(n, plaintext)
    rotate_letter(n, character) = isletter(character) ? rotate_any_case(n, character) : character;
    rotate_any_case(n, character) = islowercase(character) ? rotate_lower_case(n, character) : rotate_upper_case(n, character);
    rotate_lower_case(n, lower_char) = Char(Int('a') + (Int(lower_char) - Int('a') + n) % 26);
    rotate_upper_case(n, upper_char) = Char(Int('A') + (Int(upper_char) - Int('A') + n) % 26);
    ciphertext = join([rotate_letter(n, el ) for el ∈ plaintext])
    return typeof(plaintext) == Char ? ciphertext[1] : ciphertext; 
end

for i ∈ 0:26
    @eval macro $(Symbol(string("R", i, "_str")))(plaintext::String)
        rotate($i, plaintext)
    end
end
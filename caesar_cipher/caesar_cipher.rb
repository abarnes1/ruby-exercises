# a: 97, z: 122
# A: 65, Z: 90

def caesar_cipher(message, shift) 
  chars = message.split("")
  shiftedChars = []

  actual_shift = minimum_positive_shift(shift)

  chars.each do |c|
    bounds = get_bounds(c)

    if bounds
      new_code = c.ord + actual_shift

      #handle wrap around with mystery math
      if new_code > bounds[:upper]
        new_code = (new_code % bounds[:upper]) + bounds[:lower] - 1  
      end

      shiftedChars << new_code.chr
    else
      shiftedChars << c
    end
  end

  p shiftedChars.join
end

def minimum_positive_shift(shift, lower_bound = 0, upper_bound = 26) 
  max_shift = upper_bound - lower_bound

  until shift >= 0 do
    shift = shift + max_shift
  end

  shift % max_shift
end

def get_bounds(character)
  bounds = false

  if character.ord.between?(65, 90)
    bounds = {lower: 65, upper: 90}
  elsif character.ord.between?(97, 122)
    bounds = {lower: 97, upper: 122}
  end

  bounds
end

caesar_cipher("What a string!", 5)
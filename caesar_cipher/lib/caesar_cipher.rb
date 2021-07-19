# frozen_string_literal: true

# a: 97, z: 122
# A: 65, Z: 90
class CaesarCipher
  def initialize
    @bounds = [
      { lower: 65, upper: 90 },
      { lower: 97, upper: 122 }
    ]
  end

  def caesar_cipher(message, shift) 
    chars = message.split('')
    shifted_chars = []

    chars.each do |char|
      char_bounds = bounds(char)

      if char_bounds
        actual_shift = minimize_shift(shift)

        new_ord = calculate_new_code(char, actual_shift, char_bounds)

        shifted_chars << new_ord.chr
      else
        shifted_chars << char
      end
    end

    shifted_chars.join
  end

  private

  def minimize_shift(shift, lower_bound = 0, upper_bound = 26)
    max_shift = upper_bound - lower_bound
    shift += max_shift until shift >= 0
    shift % max_shift
  end

  def bounds(char)
    @bounds.find { |bound| char.ord.between?(bound[:lower], bound[:upper]) }
  end

  def calculate_new_code(char, shift, bounds)
    new_ord = char.ord + shift

    # handle wrap around
    new_ord = (new_ord % bounds[:upper]) + bounds[:lower] - 1 if new_ord > bounds[:upper]

    new_ord
  end
end

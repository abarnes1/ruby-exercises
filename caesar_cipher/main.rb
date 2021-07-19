require_relative 'lib/caesar_cipher'

cipher = CaesarCipher.new
encoded_message = cipher.encode('What a string!', 5)
puts encoded_message
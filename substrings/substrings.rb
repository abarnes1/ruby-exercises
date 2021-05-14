dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
# > substrings("below", dictionary)
# => { "below" => 1, "low" => 1 }

# > substrings("Howdy partner, sit down! How's it going?", dictionary)
#   => { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }

def substrings(string, dictionary)
  grouped_count = dictionary.reduce(Hash.new(0)) do |result, item|
    string.split(" ").each do |word|
      result[item] += 1 if word.downcase.include? item.downcase
    end

    result
  end

  grouped_count
end

p substrings("below", dictionary)
p substrings("Howdy partner, sit down! How's it going?", dictionary)

#alternate method after learning scan exists
# def substrings_scan(string, dictionary)
# results = Hash.new()
#   dictionary.each do |word|
#     results[word] = string.downcase.scan(word).count if string.downcase.include? word
#   end

#   results
# end

#   p substrings_scan("below", dictionary)
#   p substrings_scan("Howdy partner, sit down! How's it going?", dictionary)
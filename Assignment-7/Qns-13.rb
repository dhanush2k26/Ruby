print "Enter the character with includes  parentheses: "
text=gets.chomp

regex = /\((?:[^()]+|\g<0>)*\)/
matches = text.scan(regex)
puts "Extracted Content:"
p matches.join
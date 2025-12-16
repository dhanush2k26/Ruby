
print "Enter the Sentence of word:"
sen=gets.chomp
print "Enter the pattern to replace:"
pat=gets.chomp
print "Enter the word to replace:"
rpl=gets.chomp


puts "After the replacement the text will be:"
puts sen.gsub(/#{pat}/,rpl)
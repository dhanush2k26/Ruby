print "Enter Sentence:"
sentence = gets.chomp
regex = /\b(\w+)\s+\1\b/i

sentence.enum_for(:scan, regex).each do
  # match = Regexp.last_match
  puts "Repeated word: #{Regexp.last_match[0]}"
  puts "Index: #{Regexp.last_match.begin(1)}"
end
# sentence.enum_for(:scan, regex).each do |m|
#   puts m
# end

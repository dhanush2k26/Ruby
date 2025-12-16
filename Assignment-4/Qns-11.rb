require 'colorize'
def left_trim(str,char)
  str.sub(/^#{Regexp.escape(char)}+/, "")
end

def right_trim(str,char)
  str.sub(/#{Regexp.escape(char)}+$/, "")
end

def both_trim(str,char)
   str.sub(/^#{Regexp.escape(char)}+/, "").sub(/#{Regexp.escape(char)}+$/, "")
end
def remove_all(str,char)
  str.gsub(/#{Regexp.escape(char)}/,"")
end
print "Enter the Sentence of word:".blue
sen=gets.chomp
print "Enter the char to trim:".blue
pat=gets.chomp

puts "After the left trim:".blue
puts left_trim(sen,pat)
puts "After the right trim:".blue
puts right_trim(sen,pat)
puts "After the both trim:".blue
puts both_trim(sen,pat)

puts "After remove all matching char:".blue
puts remove_all(sen,pat)
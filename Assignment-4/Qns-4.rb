print "Enter the string: "
str = gets.chomp
print "Enter the character to count: "
char = gets.chomp

count = str.count(char)
puts "The character '#{char}' occurs #{count} times in the string."
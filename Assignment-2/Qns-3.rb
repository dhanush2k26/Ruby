=begin
Write a Ruby program to create a new string from a given string with the last 
character added at the front and back of the given string. The length of the given 
string must be 1 or more. 
=end


puts "Enter a string (length 1 or more):"
str = gets.chomp
if str.length >= 1
  last_char = str[-1]
  new_str = last_char + str + last_char
  puts "New string: #{new_str}"
else
  puts "String must be at least 1 character long."
end
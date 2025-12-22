#Write a Ruby program to shuffle elements in an array list. 

print "Enter the Array Element with Space Seperated:"
a=gets.chomp.split
puts "Given Array:"
print a.join(" ")
a = a.shuffle
puts "\nAfter 1st time Shuffle the Array:"
print a.join(" ")

a = a.shuffle
puts "\nAfter 2nd time Shuffle the Array:"
print a.join(" ")
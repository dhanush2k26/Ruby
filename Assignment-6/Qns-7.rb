#Write a Ruby program to reverse the array contents.

print "Enter the Array Element with Space Seperated:"
a=gets.chomp.split
puts "The Given Array:"
print a.join(" ")
a=a.reverse
puts "The reversed Array:"
print a.join(" ")
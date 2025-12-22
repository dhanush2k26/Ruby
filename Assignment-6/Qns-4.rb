#4. Write a Ruby program to replace the second element of an ArrayList with the specified element. 

print "Enter the Array Element with Space Seperated:"
a=gets.chomp.split

puts a.join(" ")
print "Enter element to replace:"
n=gets.chomp
a[1]=n

puts "After replacing Array Second Element:"
puts a.join(" ")



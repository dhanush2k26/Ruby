#6. Write a Ruby program to find the common elements between two arrays (string values). 
print "Enter the  1st Array  Element with space Seperated:"
a1=gets.chomp.split
print "Enter the  2nd Array  Element with space Seperated:"
a2=gets.chomp.split
common = a1 & a2
if common.empty?
  puts "There is no Common Element found in Array"
else
  puts "The Common Element Array:"
  print common.join(" ")
end
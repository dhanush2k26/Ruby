#8. Write a Ruby program to count the number of occurrences of the given number in a sorted array of integers 

def count_occurrences(arr, num)
  arr.count(num)
end
print "Enter the array of element with space seperated:"
arr=gets.chomp.split.map(&:to_i)
puts "The Given Array is #{arr.join(" ")}"
sorted_array=arr.sort
print "The sorted array is #{sorted_array.join(" ")}"
print "\nEnter the number to count the  occurrences in array:"
num=gets.chomp.to_i
puts "Number #{num} occurs #{count_occurrences(sorted_array, num)} times."
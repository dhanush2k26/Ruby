def sorting(arr)
  arr.sort_by { |a| a }
end
print "Enter the array of string value by space separated:"
arr = gets.chomp.split
sorted = sorting(arr)
final_value = sorted
puts final_value


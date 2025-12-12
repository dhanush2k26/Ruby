print "Enter Array Elements separated by space :"
arr = gets.chomp.split(" ").map(&:to_i)
arr_twos_count = arr.count(2)
arr_fives_count = arr.count(5)

if arr_twos_count > arr_fives_count
  p "More number of 2's"
elsif arr_fives_count > arr_twos_count
  p "More number of 5's"
else
  p "Equal number of 2's and 5's"
end
print "Enter Array Elements separated by space : "
arr = gets.chomp.split(" ").map(&:to_i)
if arr.all? { |x| x == 3 || x == 5 }
  p "Every element is either 3 or 5"
else
  p "Not every element is 3 or 5"
end

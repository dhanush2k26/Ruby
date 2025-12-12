# Question 16: Write a Ruby program to set 5 to 1 if there is a 3 immediately followed by a 5 in a given array of integers (length 3).

puts "Enter 3 integers separated by spaces:"
array = gets.chomp.split.map(&:to_i)
if array.length == 3
  array.each_with_index do |num, index|
    if num == 3 && index < array.length - 1 && array[index + 1] == 5
      array[index + 1] = 1
    end
  end
end
puts "Modified array: #{array}"
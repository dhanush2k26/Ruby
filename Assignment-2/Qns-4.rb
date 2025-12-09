# Question 4: Write a Ruby program to sort a numeric array and a string array.

puts "Sorting of the Array\n1.Numeric Array\n2.String Array"

print "Enter the choice: "
n = gets.to_i

case n
when 1
  print "Enter numbers separated by spaces (e.g. 3 1 4): "
  arr = gets.chomp.split.map(&:to_i)
  if arr.empty?
    puts "No numbers entered."
  else
    sorted = arr.sort
    puts "Original array: #{arr.join(' ')}"
    puts "Sorted array: #{sorted.join(' ')}"
  end
when 2
  print "Enter strings separated by commas or spaces (e.g. apple, banana pear): "
  input = gets.chomp
  arr = if input.include?(',')
          input.split(',').map(&:strip).reject(&:empty?)
        else
          input.split.reject(&:empty?)
        end
  if arr.empty?
    puts "No strings entered."
  else
    sorted = arr.sort
    puts "Original array: #{arr.join(', ')}"
    puts "Sorted array: #{sorted.join(', ')}"
  end
else
  puts "Invalid choice. Please enter 1 or 2."
end
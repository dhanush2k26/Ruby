require_relative 'linked_list'

# Qn 13: Iterate through all elements in a linked list starting at specified position (interactive)
list = LinkedList.new
print "Enter list elements separated by space: "
input = gets.chomp
values = input.split(/\s+/).reject(&:empty?)
values.each { |v| list.push(v) }

if list.size == 0
	puts "No values provided; exiting."
	exit
end

print "Enter start index (0-based): "
start_index = gets.chomp.to_i
if start_index < 0 || start_index >= list.size
	puts "Invalid start index (must be between 0 and #{list.size - 1})."
	exit
end

puts "Iterating from index #{start_index}:"
list.each_from(start_index) { |v| puts v }

puts "As array from index #{start_index}: #{list.to_a[start_index..-1].inspect}"

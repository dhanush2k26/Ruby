require_relative 'linked_list'

# Qn 14: Insert elements into linked list at the first and last positions (interactive)
list = LinkedList.new
print "Enter starting list elements separated by space (or press enter for empty): "
input = gets.chomp
values = input.split(/\s+/).reject(&:empty?)
values.each { |v| list.push(v) }
puts "Starting list: #{list}"

print "Enter value to insert at first: "
value_first = gets.chomp
list.insert_first(value_first)
puts "After insert_first(#{value_first}): #{list}"

print "Enter value to insert at last: "
value_last = gets.chomp
list.insert_last(value_last)
puts "After insert_last(#{value_last}): #{list}"

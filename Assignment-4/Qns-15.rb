require_relative 'linked_list'

# Qn 15: Insert elements at specified positions into a linked list (interactive)
list = LinkedList.new
print "Enter starting list elements separated by space (or press enter for empty): "
values = gets.chomp.split(/\s+/).reject(&:empty?)
values.each { |v| list.push(v) }
puts "Original list: #{list}"

print "How many insertions would you like to make? "
count = gets.chomp.to_i
(1..count).each do |i|
	print "Insertion #{i} - Enter index (0..#{list.size}) to insert at: "
	idx = gets.chomp.to_i
	if idx < 0 || idx > list.size
		puts "Index out of bounds; skipping"
		next
	end
	print "Enter value to insert at index #{idx}: "
	val = gets.chomp
	list.insert_at(idx, val)
	puts "List now: #{list}"
end

puts "Final list: #{list}"

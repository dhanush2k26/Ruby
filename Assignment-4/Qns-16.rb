require_relative 'linked_list'

# Qn 16: Join two linked lists (interactive)
list1 = LinkedList.new
print "Enter elements for the first list (space separated): "
values1 = gets.chomp.split(/\s+/).reject(&:empty?)
values1.each { |v| list1.push(v) }

list2 = LinkedList.new
print "Enter elements for the second list (space separated): "
values2 = gets.chomp.split(/\s+/).reject(&:empty?)
values2.each { |v| list2.push(v) }

puts "List1: #{list1}"
puts "List2: #{list2}"

print "Join list2 to list1? (y/N): "
resp = gets.chomp
if resp.downcase == 'y'
	list1.concat(list2)
	puts "Joined list: #{list1}"
else
	puts "No join performed."
end

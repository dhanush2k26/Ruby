require_relative "linked_list"

list = LinkedList.new

print "Enter how many value Want insert in Linked Lists:"
n=gets.chomp.to_i
n.times do |i|
     print "Enter the value #{i}"
     val=gets.chomp
     list.push(val)
end
list.each { |e| puts e }   
print "Enter the value to insert  end of linked list:"
endval=gets.chomp
list.insert_last(endval)
list.each { |e| puts e }   

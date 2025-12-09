print "Enter the value with space seperaterd:"
n=gets.chomp.split.map(&:to_i)
dup=n.select{ |i| n.count(i)>1}.uniq
puts dup
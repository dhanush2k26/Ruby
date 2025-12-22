class MyMath
   def add(*v)
     v.sum
   end

end
m=MyMath.new
print "Different parameter of the Addition:"
print "\nEnter the Two integer value with space Seperated:"
v1,v2=gets.chomp.split.map(&:to_i)
puts "The Sum of the Two parameter Addition is #{m.add(v1,v2)}"
print "\nEnter the Three integer value with space Seperated:"
v1,v2,v3=gets.chomp.split.map(&:to_i)
puts "The Sum of the Three parameter Addition is #{m.add(v1,v2,v3)}"
print "\nEnter the Four integer value with space Seperated:"
v1,v2,v3,v4=gets.chomp.split.map(&:to_i)
puts "The Sum of the Four parameter Addition is #{m.add(v1,v2,v3,v4)}"

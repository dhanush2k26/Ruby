module University
  class Student
    attr_accessor :name, :age, :address

    def initialize(name = 'unknown', age = 0, address = 'not available')
      @name = name
      @age = age
      @address = address
    end

    # setInfo variant can accept 2 or 3 parameters
    def setInfo(name, age, address = nil)
      @name = name
      @age = age
      @address = address if address
    end
  end
end
print "Enter student name:"
name=gets.chomp
print "Enter student age:"
age=gets.chomp.to_i
print "Enter student address (or press Enter to skip):"
address=gets.chomp
student = University::Student.new
if address.empty?   
  student.setInfo(name, age)
else
  student.setInfo(name, age, address)
end
puts "Student Details:"
puts "Name: #{student.name}"
puts "Age: #{student.age}"
puts "Address: #{student.address}"

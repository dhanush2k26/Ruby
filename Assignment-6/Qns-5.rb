class Person
  attr_accessor :age
 def SetAge(age)
    @age=age
 end
 def greet
  puts "Hello"
 end
end

class Student <Person
  def GoToClasses
    puts "I’m going to class."
  end
 def ShowAge()
  puts "My age is #{age} years old"
 end
end

class Teacher<Person
  @subject
  def getSubject(subject)
    @subject=subject
  end
   def Explain
    puts "Explanation begins"
  end
end

  p=Person.new
  p.greet

  s=Student.new
  s.SetAge(10)
  s.greet
  s.ShowAge

  t=Teacher.new
  t.SetAge(0)
  t.greet
  t.Explain


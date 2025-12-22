class  Student 
 attr_accessor :register_No,:studentName
  def get_Detail
    print "Enter the Student Name:"
    register_No=gets.chomp
    print "Enter the Register No:"
    studentName=gets.chomp.to_i
  end

  def display
      puts "\n--Student Information--"
      puts "Student Name: #{studentName}"
      puts "Register Number: #{register_No}"
  end
end


class Course < Student
     attr_accessor :courseName,:semester
    def get_Detail
      super
      print "Enter Course name:"
      courseName=gets.chomp
      print "Enter Semester:"
      semester=gets.chomp
    end

    def show
      puts "Semester: #{semester}"
      puts "Course Name: #{courseName}"
    end
end

class Subject <Course
  marks=[] 
end
class Student
  attr_accessor :register_no, :student_name

  def get_detail
    print "Enter Register number: "
    @register_no = gets.chomp
    print "Enter Student Name: "
    @student_name = gets.chomp
  end

  def print_info
    puts "\n--Student Information--"
    puts "Register Number: #{@register_no}"
    puts "Student Name: #{@student_name}"
  end
end

class Course < Student
  attr_accessor :course_name, :semester

  def get_detail
    super
    print "Enter Course name: "
    @course_name = gets.chomp
    print "Enter Semester: "
    @semester = gets.chomp.to_i
  end

  def show
    print_info
    puts "Course Name: #{@course_name}"
    puts "Semester: #{@semester}"
  end
end

class Subject < Course
  attr_accessor :marks, :total, :average

  def get_detail
    super
    @marks = []
    puts "Enter marks for 5 subjects:"
    5.times do |i|
      print "Subject #{i + 1}: "
      @marks << gets.chomp.to_i
    end
    calculate_total_and_average
  end

  def calculate_total_and_average
    @total = @marks.sum
    @average = @total / 5.0
  end

  def show_mark
    show
    puts "--- Subject Marks ---"
    @marks.each_with_index do |mark, i|
      puts "Subject #{i + 1}: #{mark}"
    end
    puts "Total Marks: #{@total}"
    puts "Average Marks: %.2f" % @average
    puts "-----------------------------------"
  end
end


begin
  print "Enter number of students: "
  n = gets.chomp.to_i
  students = []

  n.times do |i|
    puts "\n========== Student #{i + 1} =========="
    s = Subject.new
    s.get_detail
    students << s
  end

  puts "\n\n********** RESULTS **********"
  students.each_with_index do |student, i|
    puts "\n========== Student #{i + 1} Result =========="
    student.show_mark
  end
rescue => e
  puts "Error: #{e.message}"
end

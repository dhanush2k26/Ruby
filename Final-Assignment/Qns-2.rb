def self.calculate_average(numbers) 
  begin
    raise TypeError unless numbers.is_a?(Array)
     puts numbers.inspect
    raise ZeroDivisionError if numbers.empty?
    sum_of_arr = numbers.sum
    size = numbers.length
    avg = sum_of_arr.to_f / size
    return avg
  rescue TypeError
    return "Input Value should be an array"
  rescue ZeroDivisionError
    return "Array Should not be Empty"
  end
end 
print "Enter the Numbers with Space Separated: "
num = gets.chomp.split.map(&:to_i)
puts calculate_average(num)
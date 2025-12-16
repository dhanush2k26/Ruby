=begin
 . Parsing CSV Data with Quoted Commas: 
You have a string representing a CSV line where some fields might be enclosed in 
double quotes and contain commas (e.g., apple,banana,"grape,kiwi",orange). Write a 
regex to split this string into an array of its four correct fields, handling the quoted 
comma correctly 
=end
print "Enter a CSV line: "
input_csv = gets.chomp
def parse_csv_line(line)
  regex = /,(?=(?:[^"]*"[^"]*")*[^"]*$)/
  line.split(regex).map { |field| field.gsub(/\A"|"\z/, '') }
end
fields = parse_csv_line(input_csv)
puts "Parsed fields:"
fields.each_with_index do |field, index|
  puts "Field #{index + 1}: #{field}"
end
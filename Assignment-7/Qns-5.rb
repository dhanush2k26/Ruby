=begin
5. Finding Specific Date Formats: 
Write a Ruby script that finds and extracts all dates in the format DD/MM/YYYY from 
a given text, but only if the year is in the range 1900-2099 and the day/month values 
are valid (e.g., 31 is not valid for February).
=end
require 'date'
print "Enter text: "
text=gets.chomp
regex=/\b(0[1-9]|[12]\d|3[01])\/(0[1-9]|1[0-2])\/(19\d{2}|20\d{2})\b/

dates = text.scan(regex).map { |d| d.join("/") }
valid_dates = dates.select do |date|
  day, month, year = date.split('/').map(&:to_i)
  begin
	Date.valid_date?(year, month, day)
  rescue
	false
  end
end

puts "Valid dates:"
if valid_dates.empty?
    puts "Invaild Date"
else 
  puts dates.join
end
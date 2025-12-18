def transform_data(data_array)
  tranformed=data_array.map do |name|
    name.split.map(&:capitalize).join(" ")
  end
  tranformed.each_with_index do |data,index|
    yield(data,index) if block_given?
  tranformed
  end
end

puts "Enter names (type 'done' when finished):"
names = []
loop do
  print "Enter a name (firstname lastname):"
  input = gets.chomp
  break if input == "done"
  names << input
end


puts "--- Original Names ---"
names.each_with_index do |data,index|
    puts "#{index+1}. #{data}"
end


puts "--- Transformed Names Array ---"
transformed_names=transform_data(names)
puts transformed_names

puts "--- Transformed Names (via yield) ---"
  transform_data(names) do |name,index|
    puts "Name ##{index+1}: #{name}"  
  end

puts "\n--- Alternative: Using each_with_index ---"
transformed_names.each_with_index do |name, _|
  puts "Transformed: #{name}"
end
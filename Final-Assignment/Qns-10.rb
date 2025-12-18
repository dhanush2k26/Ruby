def executive(dir_path = Dir.pwd)
  puts "\nProcessing directory: #{dir_path}"
  puts "Listing items in the current directory:"
  puts "========================================"

  Dir.foreach(dir_path) do |item|
    item_path = File.join(dir_path, item)
    puts "\nItem: #{item}"
    if File.file?(item_path)
      puts "  Type: File"
      puts "  Trying to read first line..."
      begin
        File.open(item_path, 'r') do |file|
          first_line = file.gets
          puts "  First line: #{first_line.nil? ? '(File is empty)' : first_line.chomp}"
        end
      rescue => e
        puts "  Error reading file: #{e.message}"
      end
    else
      puts "  Type: Not a file (skipped)"
    end
  end

  puts "\n========================================"
  puts "Processing complete!"
end

puts "Directory File Reader"
loop do
  print "\nPress Enter to continue or type 'exit' to quit: "
  input = $stdin.gets
  break if input.nil? || input.chomp.downcase == 'exit'

  print "\nEnter directory path (or press Enter for current directory): "
  dir_path_input = $stdin.gets
  break if dir_path_input.nil?
  dir_path = dir_path_input.chomp
  dir_path = Dir.pwd if dir_path.strip.empty?

  if Dir.exist?(dir_path)
    executive(dir_path)
  else
    puts "Directory does not exist. Please try again."
  end
end


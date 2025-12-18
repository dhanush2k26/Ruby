require 'colorize'
puts "Enter the log per line:"
puts "Example format: 192.168.1.1 - - [10/Oct/2000:13:55:36 -0700] 'GET /api/users HTTP/1.1' 200"
puts "Type 'END' on a new line when you're finished"
names = []
loop do
  print "> "
  input = gets.chomp
  break if input == "END"
  names << input
end
logs=[]
match_count=0
error_count=0
LOG_REGEX = /^(?!')(?<ip>\S+)\s+-\s+(?<user>\S+)\s+\[(?<timestamp>.*?)\]\s+"(?<method>\S+)\s+(?<path>\S+)\s+(?<protocol>\S+)"\s+(?<status>\d+)/i
names.each do |log_entry|
  match = log_entry.match(LOG_REGEX)

  if match
    logs << "Ip address: #{match[:ip]}\nTimestamp: #{match[:timestamp]}\nHttp method: #{match[:method]}\nPath: #{match[:path]}\nStatus code: #{match[:status]}"
    match_count+=1
  else
    logs << " Raw: #{log_entry} \nError: Could not parse completely"
    error_count+=1
  end
end

logs.each_with_index do |data,index|
   puts "Log Entry ##{index+1}:".yellow
   puts data
   puts "Total logs parsed: #{match_count}"
   puts "Total logs with errors: #{error_count}"
end


print "Would you like to save the results to a file? (y/n): "
answer = gets.chomp.downcase

if answer == 'y'

  print "Enter filename (default: parsed_logs.txt): "
  filename = gets.chomp
  filename = "parsed_logs.txt" if filename.empty?

  File.open(filename, "w") do |file|
    logs.each_with_index do |entry, index|
      file.puts "--- Log Entry ##{index + 1} ---"
      file.puts "#{entry}"
      file.puts "\n"
    end
    file.puts "Total logs parsed: #{match_count}"
    file.puts "Total logs with errors: #{error_count}"
  end

  puts "Results saved to #{filename}"
else
  puts "Results not saved."
end

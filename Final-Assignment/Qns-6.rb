require "colorize"
puts "TIME SCHEDULE GENERATOR".yellow
puts "Enter START TIME:".yellow
puts "Please enter time in format HH:MM (24-hour format, e.g., 09:30 or 14:45):".blue 
start_input = gets.chomp
start_hour, start_minute = start_input.split(":").map(&:to_i)
start_time = Time.new(Time.now.year, Time.now.month, Time.now.day, start_hour, start_minute)
puts "Enter END TIME:".yellow
puts "Please enter time in format HH:MM (24-hour format, e.g., 09:30 or 14:45):".blue 
end_input = gets.chomp
end_hour, end_minute = end_input.split(":").map(&:to_i)
end_time = Time.new(Time.now.year, Time.now.month, Time.now.day, end_hour, end_minute)
puts "Enter INTERVAL in minutes:".blue
interval_minutes=gets.chomp.to_i

def generate_schedule(start_time, end_time, interval_minutes)
  interval=interval_minutes*60
  (start_time.to_i..end_time.to_i).step(interval).map do |timestamp|
    Time.at(timestamp).strftime("%H:%M")
  end
end
puts "GENERATING SCHEDULE...".green
res=generate_schedule(start_time, end_time, interval_minutes)
puts "Generated #{res.count} time slot(s):".yellow
puts res
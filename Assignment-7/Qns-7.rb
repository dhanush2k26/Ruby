print "Enter log line: "
log = gets.chomp

regex = /\[(?<log_level>\w+)\]\s+\[(?<timestamp>[^\]]+)\]\s+User\s+'(?<username>[^']+)'\s+logged in from IP\s+(?<ip_address>[\d.]+)/

match = log.match(regex)

if match
  puts match.named_captures
else
  puts "Invalid log format"
end
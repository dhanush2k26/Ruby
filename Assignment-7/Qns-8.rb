def valid_ip?(ip)
  regex = /\A((25[0-5]|2[0-4]\d|1?\d{1,2})\.){3}(25[0-5]|2[0-4]\d|1?\d{1,2})\z/
  !!(ip =~ regex)
end

print "Enter IP address: "
ip = gets.chomp

puts valid_ip?(ip) ? "Valid IP" : "Invalid IP"
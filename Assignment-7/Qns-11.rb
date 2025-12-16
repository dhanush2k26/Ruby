def parse_phone(phone)
  regex = /\A(?:(?<country_code>1)[.\s-]?)?\(?((?<area_code>\d{3}))\)?[.\s-]?(?<exchange>\d{3})[.\s-]?(?<subscriber_number>\d{4})\z/
  match = phone.match(regex)
  match ? match.named_captures : nil
end

puts "US Number Validation"
print "Enter the US Phone Number: "
num=gets.chomp

result = parse_phone(num)

puts result ? result : "Invalid phone number"
puts "Email Address Validator"

def valid_email?(email)

  regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  email.match?(regex)
end

print "Enter an email address: "
input_email = gets.chomp
if valid_email?(input_email)
  puts "#{input_email} is a valid email address."
else
  puts "#{input_email} is not a valid email address."
end
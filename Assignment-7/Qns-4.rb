=begin
4. Identifying Strong Passwords: 
Develop a regex pattern to validate a "strong" password. A strong password must 
meet all of the following criteria: 
• At least 8 characters long. 
• Contains at least one uppercase letter. 
• Contains at least one lowercase letter. 
• Contains at least one digit. 
• Contains at least one special character from the set !@#$%^&*(). 
• Hint: Use positive lookaheads (?=...) to check all conditions without 
consuming the string. 
=end


def strong_password?(password)
  regex = /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()]).{8,}\z/
  !!(password =~ regex)
end
print "Enter the password:"
password=gets.chomp
puts strong_password?(password) ? "Strong Password" : "Weak Password"

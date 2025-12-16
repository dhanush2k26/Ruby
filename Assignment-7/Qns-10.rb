print "Enter expression: "
expr = gets.chomp

balance = 0
valid = true

expr.each_char do |ch|
  balance += 1 if ch == '('
  balance -= 1 if ch == ')'
  if balance < 0
    valid = false
    break
  end
end

puts (valid && balance == 0) ? "Balanced" : "Not Balanced"
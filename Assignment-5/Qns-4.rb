class Account
  attr_reader :balance


  def initialize(balance = 0)
    @balance = balance
  end

  def deposit(amount)
    raise 'Invalid amount' if amount <= 0
    @balance += amount
    "Deposited #{amount}; Balance: #{@balance}"
  end

  def withdraw(amount)
    raise 'Invalid amount' if amount <= 0
    if amount > @balance
      "Insufficient funds: requested #{amount}; Balance: #{@balance}"
    else
      @balance -= amount
      "Withdrew #{amount}; Balance: #{@balance}"
    end
  end
end

account = Account.new

loop do
  puts "\nBank Account Menu:"
  puts "1. Deposit"
  puts "2. Withdraw"
  puts "3. Check Balance"
  puts "4. Exit"
  print "Choose an option: "
  choice = gets.chomp.to_i

  case choice
  when 1
    print "Enter deposit amount: "
    amount = gets.chomp.to_f
    begin
      puts account.deposit(amount)
    rescue => e
      puts e.message
    end
  when 2
    print "Enter withdrawal amount: "
    amount = gets.chomp.to_f
    begin
      puts account.withdraw(amount)
    rescue => e
      puts e.message
    end
  when 3
    puts "Current Balance: #{account.balance}"
  when 4
    puts "Exiting..."
    break
  else
    puts "Invalid option. Please try again."
  end
end

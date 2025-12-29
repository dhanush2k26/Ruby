class InsufficientFundsError < StandardError
  attr_reader :balance, :amount
  def initialize(balance, amount)
    @balance = balance
    @amount = amount
  end
  def to_s
    "Insufficient funds: Your balance is $#{'%.2f' % @balance}, but you tried to withdraw $#{'%.2f' % @amount}."
  end
end

class BankAccount
  attr_reader :account_number, :balance, :log_file

  def initialize(account_number = nil, initial_balance = 0.0, log_file = "bank_account.log")
    @account_number = account_number
    @balance = initial_balance
    @log_file = "#{account_number}.log" if account_number
    initialize_log_file
  end

  def deposit(amount)
    validate_amount(amount)
    @balance += amount
    log_transaction("Deposit", amount, @balance)
  end

  def withdraw(amount)
    validate_amount(amount)
    if amount > @balance
      raise InsufficientFundsError.new(@balance, amount)
    end
    @balance -= amount
    log_transaction("Withdraw", amount, @balance)
    puts "Withdrawal of $#{'%.2f' % amount} successful. New balance: $#{'%.2f' % @balance}"
  end

  def display_balance
    puts "Current balance: $#{'%.2f' % @balance}"
  end

  private

  def validate_amount(amount)
    if amount <= 0
      raise ArgumentError, "Deposit amount must be positive."
    end
  end

  def log_transaction(type, amount, new_balance)
    File.open(@log_file, 'a') do |file|
      formatted_time = Time.now.strftime("%d-%B-%Y %I:%M:%S %p")
      file.puts("#{formatted_time} - #{type}: $#{'%.2f' % amount}, New Balance: $#{'%.2f' % new_balance}")
    end
  end

  def initialize_log_file
    unless File.exist?(@log_file)
      File.open(@log_file, 'w') do |file|
        file.puts("Bank Account Transaction Log")
        file.puts("Account Number: #{@account_number}") if @account_number
        file.puts("===================================")
        file.puts("Initial balance:#{@balance}")
      end
    end
  end
end

def handle_withdrawal(account, amount)
  begin
    account.withdraw(amount)
  rescue InsufficientFundsError => e
    puts "Error: #{e.to_s}"
    log_failed_transaction(account, amount, account.balance)
  end
end

def handle_deposit(account, amount)
  begin
    account.deposit(amount)
    puts "Deposit of $#{'%.2f' % amount} successful. New balance: $#{'%.2f' % account.balance}"
  rescue ArgumentError => e
    puts "Error: #{e.message}"
  end
end

def log_failed_transaction(account, amount, balance)
  failed_log_file = "FailedTransaction.log"
  File.open(failed_log_file, 'a') do |file|
      formatted_time = Time.now.strftime("%d-%B-%Y %I:%M:%S %p")
    file.puts("#{formatted_time} - ###FAILED_WITHDRAWAL From the Account #{account.account_number} : Failed Withdraw: $#{'%.2f' % amount}, Balance remains: $#{'%.2f' % balance}")
  end
end

def view_transaction_log(account)
  failed_log_file = "FailedTransaction.log"
  puts "Transaction Log for Account #{account.account_number}:"
  if File.exist?(failed_log_file)
    File.foreach(failed_log_file) { |line| puts line }
  else
    puts "No transaction log found for this account."
  end
end

  puts "Welcome to the Bank Account Management System"
  print "Enter account number: "
  acc_num = gets.chomp
  print "Enter initial balance: $"
  init_bal = gets.chomp.to_f
  

  failed_log_file = "FailedTransaction.log"
  unless File.exist?(failed_log_file)
    File.open(failed_log_file, 'a') do |file|
      file.puts("Failed Transaction Log")
      file.puts("=========================")
    end
  end

  account = BankAccount.new(acc_num, init_bal)
  
  loop do
    puts "\nSelect an option for account #{acc_num}:"
    puts "1. Deposit"
    puts "2. Withdraw"
    puts "3. Check Balance"
    puts "4. View Transaction Log"
    puts "5. Exit"
    print "Enter your choice (1-5): "
    choice = gets.chomp

    case choice
    when '1'
      begin
        print "Enter deposit amount: $"
        amount_input = gets.chomp
        if amount_input.match?(/[^0-9.]/) || amount_input.empty?
          raise ArgumentError, "Invalid input. Please enter a valid numeric amount without special characters or letters."
        end
        amount = amount_input.to_f
        handle_deposit(account, amount)
      rescue ArgumentError => e
        puts "Error: #{e.message}"
        retry
      end
    when '2'
      begin
        print "Enter withdrawal amount: $"
        amount_input = gets.chomp
        if amount_input.match?(/[^0-9.]/) || amount_input.empty?
          raise ArgumentError, "Invalid input. Please enter a valid numeric amount without special characters or letters."
        end
        amount = amount_input.to_f
        handle_withdrawal(account, amount)
      rescue ArgumentError => e
        puts "Error: #{e.message}"
        retry
      end
    when '3'
      account.display_balance
    when '4'
      puts "Transaction Log:"
      if File.exist?(account.log_file)
        File.foreach(account.log_file) { |line| puts line }
      else
        puts "No transaction log found for this account."
      end
    when '5'
      puts "Thank you for using the Bank Account Management System. Goodbye!"
      exit
    else
      puts "Invalid choice. Please select a valid option."
    end
  end

module CurrencyFormatter
    def format_currency(amount)
     "$#{'%.2f' % amount}"
    end
end

class Document
    attr_accessor :id,:date
     def initialize(id,date)
        @id=id
        @date=date
    end
    def display
    puts "Document ID: #{@id}"
    puts "Date: #{@date}"
    end
end

class Invoice < Document
     attr_accessor :customer_name,:items
     include CurrencyFormatter
     def initialize(id,date,customer_name)
        super(id,date)
        @customer_name=customer_name
        @items=[]
     end
     def add_item(name,quantity,price)
         @items << { name:name ,quantity:quantity.to_f,price:price.to_f } 
     end

     def print_invoice_total
        total_amount=@items.reduce(0) { |sum,item| sum+(item[:quantity]*item[:price])}
        puts "=== INVOICE DETAILS ==="
        display
        puts "Customer: #{@customer_name}"
        puts "Items:"
        puts "--------------------------------"
        @items.each_with_index do|item,index|
        item_total=item[:quantity]*item[:price]
        puts "#{index+1}. #{item[:name]}"
        puts " Quantity:#{item[:quantity]} x #{format_currency(item[:price])}= #{format_currency(item_total)}"
        puts "Total amount :#{total_amount}"
        end    
     end
end

puts "----Welcome to Bill Counter----"
invoices=[]
loop do
    puts "1. Create New Invoice"
    puts "2. View All Invoices"
    puts "3. Print Invoice Total"
    puts "4. Exit"
    puts "Enter your choice (1-4):"
    choice=gets.chomp.to_i
    case choice
    when 1
        puts "Lets start"
        print "Enter the Invoice Id:"
        id=gets.chomp.to_i
        print "Enter the Date(YYYY-MM-DD):"
        date=gets.chomp
        print "Enter Customer name:"
        customer_name=gets.chomp
        inx=Invoice.new(id,date,customer_name)
        loop do
            puts "Add Items:"
            print " Enter item name: "
            name=gets.chomp
            print " Quantity: "
            quantity=gets.chomp.to_i
            print " price: "
            price=gets.chomp.to_i
            inx.add_item(name,quantity,price)
            puts "Add another item? (y/n):"
            c=gets.chomp
            break if c.downcase!="y"
           
          end 
           invoices << inx
        when 2
            puts "====All Invoices===="
            invoices.each_with_index  do |data,index|
             total_amount=data.items.reduce(0) {|sum,item| sum+(item[:quantity]*item[:price])}
             puts "#{index+1} #Invoice-#{data.customer_name}-#{data.format_currency(total_amount)}"
            end
             
     when 3
        puts "\n--- PRINT INVOICE TOTAL ---"
        puts "\n--- ALL INVOICES ---"
        invoices.each_with_index do |inv, index|
            total_amount = inv.items.reduce(0) { |sum, item| sum + (item[:quantity] * item[:price]) }
            puts "#{index + 1}. Invoice ##{inv.id} - #{inv.customer_name} - #{inv.format_currency(total_amount)}"
        end
        print "\nEnter invoice number to print total: "
        inv_number = gets.chomp.to_i
        if inv_number.between?(1, invoices.size)
            invoices[inv_number - 1].print_invoice_total
        else
            puts "Invalid invoice number."
        end  
   when 4
        puts "\nThank you for using the Billing System Application. Goodbye!"            
        break
    end
end
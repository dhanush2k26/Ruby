module  Searchable
  def find_by_regex(regex_pattern)
    begin
        regex=Regexp.new(regex_pattern,Regexp::IGNORECASE)
 
      rescue RegexpError => e
      puts "Invalid regex: #{e.message}"
      return []
      end
    @items.select do |item|
      item.values.any? { |val| val.to_s.match?(regex) }
    end
  end     
end
class ProductCollection
 include Searchable
  def initialize
  @items=[]
  end
  def add_product (name,category,price,description) 
    @items << {
      name:name,
      category:category,
      price:price,
      description:description,
    }
  end
 def display_all 
  puts "===Display All Product==="
     @items.each do |p|
       puts "Product:#{p[:name]}| Category:#{p[:category]} | Price: $#{p[:price]} | Description: #{p[:description]}"
     end
 end
end


class UserDatabase
 include Searchable
   def initialize
  @items=[]
  end
  def add_user(username,name,email,bio)
  @items << {
      username:username,
      name:name,
      email:email,
      bio:bio
    }
  end

    def  display_all
    puts "===Display All User==="
    @items.each do |un|
           puts "User:#{un[:username]}  | Name: #{un[:name]} | Email:#{un[:email]}| Bio:#{un[:bio]} "
    end
  end
end
products = ProductCollection.new

users = UserDatabase.new

puts "\n--- Enter product Details ---"

loop do

  print "Product Name (leave empty to finish): "

  name = gets.chomp

  break if name.empty?
 
  print "Category: "

  category = gets.chomp

  print "Price ($): "

  price = gets.chomp.to_f

  print "Description: "

  description = gets.chomp
 
  products.add_product(name, category, price, description)

end

puts "\n--- Enter User Details ---"

loop do
print "User Name (leave empty to finish): "

  username = gets.chomp

  break if username.empty?
 
  print "Name: "

  name = gets.chomp

  print "Email : "

  email = gets.chomp

  print "Bio: "

  bio = gets.chomp
 
  users.add_user(username,name,email,bio)
end

products.display_all
users.display_all


loop do
 
  puts "\nChoose the option:"
  puts "1. Search Products"
  puts "2. Search Users"
  puts "3. Exit"
  print "Enter your choice (1-3): "
  choice = gets.chomp.to_i

case choice

  when 1
   print "Enter the string to search:"
   regex=gets.chomp
   res=products.find_by_regex(regex)
   puts "Found #{res.size} product(s):"
   res.each do |p|

    puts "Product: #{p[:name]} | Category: #{p[:category]} | Price: $#{p[:price]} | Description: #{p[:description]}"

    end

  when 2
   print "Enter the string to search:"
   regex=gets.chomp
   res=users.find_by_regex(regex)
   puts "Found #{res.size} product(s):"
   res.each do |un|
    puts "User:#{un[:username]}  | Name: #{un[:name]} | Email:#{un[:email]}| Bio:#{un[:bio]} "
   end
  when 3

    puts "\nThank you for using the Searchable Module Demo!"

    break

  else

    puts "Invalid choice. Try again."
  end
end

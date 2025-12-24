module Stockable
  def add_stock(quantity)
    @stock ||= 0
    @stock += quantity
  end

  def remove_stock(quantity)
    @stock ||= 0
    @stock -= quantity if @stock >= quantity
  end

  def stock_level
    @stock ||= 0
    @stock
  end

  def stock_level=(value)
    @stock = value
  end

  def in_stock?
    @stock ||= 0
    @stock > 0
  end
end


class Product
  attr_accessor :name,:price,:category
  def initialize(name,price,category)
    @name=name
    @price=price
    @category=category
  end

  def display_info
    puts "Name: #{@name}, Price: #{@price}, Category: #{@category}"
  end

 
  
  def apply_discount(percentage)
   discounted_price=@price*(1-percentage/100.0)
    puts "Original price =#{@price},discount percentage=#{percentage}, and new price #{discounted_price}"
    return discounted_price
  end
end


class Electronic < Product
  include Stockable
  attr_accessor :warranty_years, :brand, :model
  def initialize(name, price, brand, model, warranty_years)
    super(name, price, "Electronics")
    @warranty_years = warranty_years
    @brand = brand
    @model = model
    @stock = 0
  end

  def display_info
    super
    puts "Brand: #{@brand}, model: #{@model}, Warranty years: #{@warranty_years}, stock level: #{stock_level}"
    puts "Status: #{in_stock? ? 'In Stock' : 'Out of Stock'}"
  end
end

class Clothing <Product
  attr_accessor :size, :material, :colo
  def initialize(name, price, size, material, color)
    super(name, price, "Clothing")
    @size = size
    @material = material
    @color = color
    @stock = 0
  end
  def display_info
    super
    puts "Size: #{@size}, Material: #{@material}, Color: #{@color}"
    print "Stock level: #{stock_level}"
    print "Status: #{in_stock? ? 'In Stock' : 'Out of Stock'}"
  end
end

class Book <Product
    attr_accessor :author,:isbn , :genre
  def initialize(name, price, author,isbn,genre)
    super(name, price, "Book")
    @author = author
    @isbn = isbn 
    @genre = genre
    @stock = 0
  end
  def display_info
    super
    puts "Author Name:#{@author}, ISBN:#{@isbn},Genre:#{@genre}"
    print "Stock level: #{stock_level}"
    print "Status: #{in_stock? ? 'In Stock' : 'Out of Stock'}"
  end
end

class InventoryManager
  attr_accessor :products
  @products=[]
  def initialize(array_of_products=[])
    @products = array_of_products
    
  end
  def add_product(product)
    @products << product
    puts "Product #{product.name} added to inventory."
  end
  def display_all_products
    @products.each do |product|
      product.display_info
      puts "-----------------------"
    end
  end

  def display_low_stock(threshold)
    @products.each do |product|
      if product.respond_to?(:stock_level) && product.stock_level < threshold
        product.display_info
        puts "-----------------------"
      end
    end
  end

  def apply_seasonal_discount(percentage)
    @products.each do |product|
      product.display_info
      puts "-----------------------"
    end
     print "1.Electronics\n2.Clothing\n3.Books\nSelect Category to apply discount:"

      category_choice=gets.chomp.to_i

      case category_choice
      when 1
        category="Electronics"
      when 2
        category="Clothing"
      when 3
        category="Book"
      else
        puts "Invalid choice"
        return
      end
    
    discount_range=get_positive_integer("Enter discount range (0-100): ")

    case discount_range 
    when 0..10
       return 5
    when 11..20
        return 10
    when 21..30
        return 15
    when 31..50
        return 20
      41..100
        return 25
    else
        puts "Invalid discount range"
        return
    end
      end
   
    @products.each do |product|
      if product.category==category
        new_price=product.apply_discount(discount_range)
        product.price=new_price
      end
  end

  def total_inventory_value
    total_value = 0
    @products.each do |product|
      if product.respond_to?(:stock_level)
        total_value += product.price * product.stock_level
      end
    end
    total_value
  end
 def search_products
    puts "Search by:\n1.Name\n2.Category\n3.Price Range"
    choice = gets.chomp.to_i
    case choice
    when 1
      print "Enter product name to search: "
      name = gets.chomp
      results = @products.select { |product| product.name.downcase.include?(name.downcase) }
    when 2
      print "Enter category to search: "
      category = gets.chomp
      results = @products.select { |product| product.category.downcase == category.downcase }
    when 3
      min_price = get_positive_float("Enter minimum price: ")
      max_price = get_positive_float("Enter maximum price: ")
      results = @products.select { |product| product.price >= min_price && product.price <= max_price }
    else
      puts "Invalid choice."
      return
    end
 end
end

def get_positive_integer(prompt)
  loop do
    print prompt
    input = gets.chomp
    if input.to_i.to_s == input && input.to_i >= 0
      return input.to_i
    else
      puts "Invalid input. Please enter a positive integer."
    end
  end
end

def get_positive_float(prompt)
  loop do
    print prompt
    input = gets.chomp
    begin
      float_val = Float(input)
      if float_val >= 0
        return float_val
      else
        puts "Invalid input. Please enter a positive number."
      end
    rescue ArgumentError
      puts "Invalid input. Please enter a positive number."
    end
  end
end

IM = InventoryManager.new

def get_product_name
  print "Enter product name: "
  name = gets.chomp
  if name.strip.empty?
    print "Product name cannot be empty. Please enter a valid name.\n"
    get_product_name
  else
    return name
  end
end

def get_product_price
  print "Enter product price: "
  price = gets.chomp.to_f
  if price < 0
    print "Price cannot be negative. Please enter a valid price.\n"
    get_product_price
  else
    return price
  end
end

def create_electronic_product
  name = get_product_name
  price = get_product_price
  print "Enter brand: "
  brand = gets.chomp
  print "Enter model: "
  model = gets.chomp
  print "Enter warranty years: "
  warranty_years = gets.chomp.to_i

  electronic = Electronic.new(name, price, brand, model, warranty_years)
  electronic.stock_level=0
  return electronic
end

def craete_clothing_product
  name = get_product_name
  price = get_product_price
  print "Enter size: "
  size = gets.chomp
  print "Enter material: "
  material = gets.chomp
  print "Enter color: "
  color = gets.chomp
  
  clothing = Clothing.new(name, price, size, material, color)
  clothing.stock_level=0
  return clothing
end
def create_book_product
  name = get_product_name
  price = get_product_price
  print "Enter author name: "
  author = gets.chomp
  print "Enter ISBN: "
  isbn = gets.chomp
  print "Enter genre: "
  genre = gets.chomp

  book = Book.new(name, price, author, isbn, genre)
  book.stock_level=0
  return book
end

def show_Inventory_report
   #Summary by category
   category_summary=Hash.new(0)
    IM.products.each do |product|
      category_summary[product.category] += product.stock_level
    end
    category_summary.each do |category, total_stock|
      puts "Category: #{category}, Total Stock: #{total_stock}"
    end
    #Top 3 highest stock items
    sorted_products=IM.products.sort_by {|product| -product.stock_level}
    top_3_products = sorted_products.first(3)
    puts "Top 3 Highest Stock Items:"
    top_3_products.each do |product|
      puts "Name: #{product.name}, Stock Level: #{product.stock_level}"
    end

    #Bottom 3 lowest stock items
    bottom_3_products = sorted_products.last(3)
    puts "Bottom 3 Lowest Stock Items:"
    bottom_3_products.each do |product|
      puts "Name: #{product.name}, Stock Level: #{product.stock_level}"
    end
    #Total inventory value
    total_value=IM.total_inventory_value
    puts "Total Inventory Value: $#{total_value}"

end

def main_menu
  loop do
    puts "\nMain Menu:"
    puts "1. Add New Electronic Product"
    puts "2. Add New Clothing Product"
    puts "3. Add New Book Product"
    puts "4. Display All Products"
    puts "5. Manage Product Stock"
    puts "6. Apply Seasonal Discount"
    puts "7. Check Low Stock items"
    puts "8. Calculate Total Inventory Value"
    puts "9. Search Products"
    puts "10. View Inventory Report"
    puts "11. Exit"
    print "Enter your choice:(1-11) "
    choice = gets.chomp.to_i

    case choice
    when 1
      electronic = create_electronic_product
      IM.add_product(electronic)
    when 2
      clothing = craete_clothing_product
      IM.add_product(clothing)
    when 3
      book = create_book_product
      IM.add_product(book)
    when 4
      IM.display_all_products
    when 5
      manage_product_stock
    when 6
      IM.apply_seasonal_discount
    when 7
      threshold = get_positive_integer("Enter stock threshold: ")
      IM.display_low_stock(threshold)
    when 8
      total_value = IM.total_inventory_value
      puts "Total Inventory Value: $#{total_value}"
    when 9
      IM.search_products
    when 10
      show_Inventory_report
    when 11
      puts "Exiting Inventory Management System. Goodbye!"
      break
    else
      puts "Invalid choice. Please select a valid option."
    end
  end
end

def manage_product_stock
  print "Enter product name to manage stock: "
  name = gets.chomp
  product = IM.products.find { |p| p.name.downcase == name.downcase }

  if product.nil?
    puts "Product not found."
    return
  end

  puts "Managing stock for product: #{product.name}"
  puts "1. Add Stock"
  puts "2. Remove Stock"
  print "Enter your choice (1-2): "
  choice = gets.chomp.to_i

  case choice
  when 1
    quantity = get_positive_integer("Enter quantity to add: ")
    product.add_stock(quantity)
    puts "Added #{quantity} units to #{product.name}. New stock level: #{product.stock_level}"
  when 2
    quantity = get_positive_integer("Enter quantity to remove: ")
    if quantity > product.stock_level
      puts "Insufficient stock to remove #{quantity} units."
    else
      product.remove_stock(quantity)
      puts "Removed #{quantity} units from #{product.name}. New stock level: #{product.stock_level}"
    end
  else
    puts "Invalid choice."
  end
end


main_menu
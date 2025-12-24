module Stockable
  attr_accessor :quantity

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

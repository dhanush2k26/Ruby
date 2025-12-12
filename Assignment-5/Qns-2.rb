def matrix_multiply(a, b)
  rows_a = a.size
  cols_a = a[0].size
  rows_b = b.size
  cols_b = b[0].size

  if cols_a != rows_b
    raise "Matrices cannot be multiplied: columns of A (#{cols_a}) != rows of B (#{rows_b})"
  end

  result = Array.new(rows_a) { Array.new(cols_b, 0) }

  (0...rows_a).each do |i|
    (0...cols_b).each do |j|
      (0...cols_a).each do |k|
        result[i][j] += a[i][k] * b[k][j]
      end
    end
  end

  result
end

def get_inputs(mat, arr)
  print "Enter number of rows for matrix #{mat}: "
  rows = gets.to_i
  print "Enter number of columns for matrix #{mat}: "
  cols = gets.to_i

  print "Enter elements of matrix #{mat} row by row (space separated): "
 
  rows.times do
    row = gets.chomp.split.map(&:to_i)
    arr << row
  end
   return arr
end

a=[]
b=[]
a=get_inputs("A",a)
b=get_inputs("B",b)

begin
  result = matrix_multiply(a, b)
  puts "Resultant matrix:"
  result.each { |row| puts row.join(" ") }
rescue => e
  puts e.message
end


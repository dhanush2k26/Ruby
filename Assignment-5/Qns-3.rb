module MatrixUtils
  class Matrix
    attr_reader :rows, :cols, :data
    def initialize(data)
      @data = data
      @rows = data.length
      @cols = data.first.length
    end

    def [](i, j)
      @data[i][j]
    end

    def self.multiply(a, b)
      raise 'Incompatible matrices' if a.cols != b.rows
      result = Array.new(a.rows) { Array.new(b.cols, 0) }
      (0...a.rows).each do |i|
        (0...b.cols).each do |j|
          sum = 0
          (0...a.cols).each do |k|
            sum += a[i,k] * b[k,j]
          end
          result[i][j] = sum
        end
      end
      Matrix.new(result)
    end
  end
end

data_a = []
data_b = []
def get_inputs(mat, arr)
print "Enter number of rows and columns for Matrix #{mat} (e.g., '2 3'): "
rows, cols = gets.chomp.split.map(&:to_i)

puts "Enter the elements of Matrix #{mat} row by row (space-separated):"
rows.times do
  row = gets.chomp.split.map(&:to_i)
  arr << row
end  
return arr
end

matrix_a = MatrixUtils::Matrix.new(get_inputs("A", data_a))
matrix_b = MatrixUtils::Matrix.new(get_inputs("B", data_b))

begin
  result_matrix = MatrixUtils::Matrix.multiply(matrix_a, matrix_b)
  puts "Resultant Matrix after multiplication:"
  result_matrix.data.each do |row|
    puts row.join(" ")
  end
rescue => e
  puts e.message
end

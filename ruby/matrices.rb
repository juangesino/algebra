# Copyright 2016, Juan I. Gesino.
# Licensed under MIT license: https://github.com/juangesino/algebra/blob/master/LICENSE

# For this script, a matrix is an array of arrays that make up the columns of the matrix.
# matrix = [ [a11, a21, ..., an1], [a12, a22, ..., an2], ..., [a1m, a2m, ..., anm] ]

class Algebra

  # Class method to find the transpose of a matrix.
  def self.transpose(matrix)
    # Start with an empty array.
    transpose = []
    # Find the number of columns.
    columns = self.columns_count(matrix)
    # Find the number of rows.
    rows = self.rows_count(matrix)
    # Build the transposed matrix by adding as many columns as rows.
    rows.times do
      transpose.push([])
    end
    # Iterate the columns.
    for i in 0..(columns - 1)
      # Iterate the rows.
      for j in 0..(rows - 1)
        # Switch columns for rows and rows for columns.
        transpose[j][i] = matrix[i][j]
      end
    end
    # Return the transposed.
    transpose
  end

  def self.multiply_matrices(matrix1, matrix2)
    # Store some important values. (TODO: remove unnecessary values.)
    matrix2_rows = self.rows_count(matrix2)
    matrix2_columns = self.columns_count(matrix2)
    matrix1_rows = self.rows_count(matrix1)
    matrix1_columns = self.columns_count(matrix1)
    # Check that the multiplication can be done.
    raise 'Dimension error: number of columns from first matrix must be equal to the number of rows from second matrix.' if matrix1_columns != matrix2_rows
    # Build the product matrix.
    product = []
    # It will have as many columns as the number of rows the second matrix has.
    (matrix2_columns).times do
      product.push([])
    end
    # We find the transposed of matrix1 to use its rows as columns.
    matrix1_transposed = self.transpose(matrix1)
    # Iterate matrix1_transposed rows.
    for i in 0..(matrix1_transposed.count - 1)
      # Iterate matrix2 columns.
      for j in 0..(matrix2.count - 1)
        # Find the dot product and store the value in the product matrix.
        product[j][i] = self.dot(matrix1_transposed[i], matrix2[j])
      end
    end
    # Return the product matrix.
    product
  end

  # Class method to find a matrix's columns.
  def self.columns_count(matrix)
    # The columns are just the matrix's elements.
    matrix.count
  end

  # Class method to find a matrix's rows count.
  def self.rows_count(matrix)
    # Check that all the rows have the same dimension.
    raise 'Dimension error: rows must have the same dimension.' if matrix.map {|col| col.count}.uniq.count != 1
    # Get the rows count.
    matrix[0].count
  end

  # Class method for finding the dot product between two vectors.
  # This algorithm uses the canonical dot product.
  # If you want to use another product, change the following method.
  def self.dot(array1, array2)
    # Check that the dimension of the two vectors are the same.
    # Raise an error when they are different.
    first_lenght = array1.count
    second_lenght = array2.count
    raise 'Wrong dimension error' if first_lenght != second_lenght
    lenght = first_lenght
    # Start with a product of zero.
    product = 0
    # Iterate the first vector's elements.
    array1.each_with_index do |a, i|
      # Multiply the element by the corresponding element of the other vector.
      # Add the multiplication to the total product.
      product = product + (a*array2[i])
    end
    # Return the product.
    product
  end

end

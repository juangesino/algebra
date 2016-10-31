# Copyright 2016, Juan I. Gesino.
# Licensed under MIT license: https://github.com/juangesino/algebra/blob/master/LICENSE

class Array

  # This algorithm uses the canonical dot product.
  # If you want to use another product, change the following method.
  def dot(array)
    # Check that the dimension of the two vectors are the same.
    # Raise an error when they are different.
    first_lenght = self.count
    second_lenght = array.count
    raise 'Wrong dimension error' if first_lenght != second_lenght
    lenght = first_lenght
    # Start with a product of zero.
    product = 0
    # Iterate the first vector's elements.
    self.each_with_index do |a, i|
      # Multiply the element by the corresponding element of the other vector.
      # Add the multiplication to the total product.
      product = product + (a*array[i])
    end
    # Return the product.
    product
  end

  # This is just an alias for the dot method when the two parameters are arrays.
  # If the second parameter is not an array map the multiplication.
  def * array
    if array.class == Array
      # If the parameter is an array apply the dot method.
      self.dot(array)
    else
      # If the parameter is not an array multiply each element by the parameter.
      self.map { |a| a*array}
    end
  end

  # Method to find the norm of a vector.
  def norm
    Math.sqrt(self.map { |e| e*e }.inject(0){|sum,x| sum + x })
  end

  # Find the cosine of the angle between two vectors.
  def self.cosine(array1, array2)
    # We have to divide the dot product by the product of the norms.
    (array1 * array2) * (1/(array2.norm * array1.norm).to_f)
  end

  # A way of representing the vectors "closeness".
  # The closer the vectors are the more similar.
  # Orthogonal vectors have a similarity of 0%.
  # Same direction vectors have a similarity of 100%.
  def self.similarity(array1, array2)
    "#{(self.cosine(array1, array2) * 100).round(3).to_s}%"
  end

  # Method to normalize a vector.
  def normalize
    # We start with a norm of zero.
    norm = 0
    # Iterate the elements from the array.
    for i in 0..(self.count - 1)
      # Add to the norm the square of each element.
      norm = norm + self[i]**2
    end
    # The norm will be equal to the square root of the addition of the squares.
    norm = Math.sqrt(norm.to_f)
    # Raise error if the norm is equal to zero.
    raise 'Can\'t normalize vector with norm = 0' if norm == 0
    # The result will be a vector.
    normalized = []
    # Iterate the vector.
    for i in 0..(self.count - 1)
      # Push into the result the element divided by the norm.
      normalized.push((self[i]/norm.to_f))
    end
    # Return the array.
    normalized
  end

end

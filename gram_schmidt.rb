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

  # Method to multiply a vector by itself.
  def norm
    self * self
  end

  # Default Ruby subtraction of arrays does not work the same as vectors.
  # Here we define the subtraction for vectors subtracting each element.
  def subtract(array)
    # We have to make sure the dimension is the same.
    # If the two dimensions are not the same we raise an error.
    first_lenght = self.count
    second_lenght = array.count
    raise 'Wrong dimension error' if first_lenght != second_lenght
    lenght = first_lenght
    # The result is an array, so we start with an empty one.
    subtraction = []
    self.each_with_index do |a, i|
      # Iterate the elements and subtract, then push into the result array.
      subtraction.push(a-array[i])
    end
    # Return the array.
    subtraction
  end

  # Just an alias for the subtract method.
  def - array
    self.subtract(array)
  end

  # Returns the orthogonal between two arrays.
  def orthogonal(array)
    # Check the dimensions, raise error if they don't match.
    first_lenght = self.count
    second_lenght = array.count
    raise 'Wrong dimension error' if first_lenght != second_lenght
    # Find and return the orthogonal.
    array - (self * ((self * array)/(self.norm.to_f)))
  end

  # Class method to find the orthogonals of an array of arrays.
  def self.orthogonals(array)
    # We need the array to contain more than one vector.
    raise 'Array must be larger than only one vector' if array.length <= 1
    # Start with and empty array of orthogonal vectors.
    orthogonals = []
    # The first vector will be part of the resulting orthogonals.
    orthogonals.push(array[0])
    # Iterate the array of vectors.
    for i in 1..(array.count - 1)
      # This is the vector for this iteration.
      vector = array[i]
      # Starting vector.
      new_vector = vector
      # Iterate the vectors from the resulting orthogonals array.
      for j in 0..(orthogonals.count - 1)
        # The orthogonal for this iteration.
        orthogonal = orthogonals[j]
        # Find the norm of the orthogonal.
        norm = (orthogonal.norm)
        # Find the product between the vector and the orthogonal.
        orth = (vector * orthogonal)
        # Change the value of the new_vector according to Gram-Schmidt.
        new_vector = new_vector - (orthogonal * (orth/norm.to_f))
      end
      # We don't want vectors that are equal to zero in our orthogonals array.
      if new_vector.is_zero?
        orthogonals.push(new_vector)
      end
    end
    # Return the orthogonals.
    orthogonals
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

  # Class method to fing the orthonormals from an array of vectors.
  def self.gram_schmidt(array)
    # Find the orthogonals of the array.
    orthogonals = Array.orthogonals(array)
    # Now we need to normalize.
    # Start with an empty array.
    orthonormals = []
    # Iterate the orthogonals.
    for i in 0..(orthogonals.count - 1)
      # Normalize each orthogonal.
      orthonormals.push(orthogonals[i].normalize)
    end
    # Return the array of orthonormal vectors.
    orthonormals
  end

  # Check if a vector is zero.
  def is_zero?
    # We define a tolerance.
    tolerance = 1e-10
    # If the elements are between +- this tolerance, we assume they are zero.
    if self.inject(0){|sum,x| sum + x } < tolerance * self.count
      false
    else
      true
    end
  end

end

class Array

  def dot(array)
    first_lenght = self.count
    second_lenght = array.count
    raise 'Wrong dimension error' if first_lenght != second_lenght
    lenght = first_lenght
    product = 0
    self.each_with_index do |a, i|
      product = product + (a*array[i])
    end
    product
  end

  def * array
    if array.class == Array
      self.dot(array)
    else
      self.map { |a| a*array}
    end
  end

  def norm
    self * self
  end

  def subtract(array)
    first_lenght = self.count
    second_lenght = array.count
    raise 'Wrong dimension error' if first_lenght != second_lenght
    lenght = first_lenght
    subtraction = []
    self.each_with_index do |a, i|
      subtraction.push(a-array[i])
    end
    subtraction
  end

  def - array
    self.subtract(array)
  end

  def orthogonal(array)
    first_lenght = self.count
    second_lenght = array.count
    raise 'Wrong dimension error' if first_lenght != second_lenght
    array - (self * ((self * array)/(self.norm.to_f)))
  end

  def self.orthogonals(array)
    raise 'Array must be larger than only one vector' if array.length <= 1
    orthogonals = []
    orthogonals.push(array[0])

    for i in 1..(array.count - 1)
      vector = array[i]

      new_vector = vector

      for j in 0..(orthogonals.count - 1)
        orthogonal = orthogonals[j]
        norm = (orthogonal.norm)
        orth = (vector * orthogonal)

        new_vector = new_vector - (orthogonal * (orth/norm.to_f))
      end
      if new_vector.is_zero?
        orthogonals.push(new_vector)
      end
    end
    orthogonals
  end

  def normalize
    norm = 0
    for i in 0..(self.count - 1)
      norm = norm + self[i]**2
    end
    norm = Math.sqrt(norm.to_f)
    raise 'Can\'t normalize vector with norm = 0' if norm == 0
    normalized = []
    for i in 0..(self.count - 1)
      normalized.push((self[i]/norm.to_f))
    end
    normalized
  end

  def self.gram_schmidt(array)
    orthogonals = Array.orthogonals(array)
    orthonormals = []
    for i in 0..(orthogonals.count - 1)
      orthonormals.push(orthogonals[i].normalize)
    end
    orthonormals
  end

  def is_zero?
    tolerance = 1e-10
    if self.inject(0){|sum,x| sum + x } < tolerance * self.count
      false
    else
      true
    end
  end

end

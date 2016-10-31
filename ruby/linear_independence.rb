# Copyright 2016, Juan I. Gesino.
# Licensed under MIT license: https://github.com/juangesino/algebra/blob/master/LICENSE

# This script requires the Matrix Ruby class (https://ruby-doc.org/stdlib-2.2.0/libdoc/matrix/rdoc/Matrix.html)
require 'matrix'

class Algebra

  # The method takes an array of vectors as parameter.
  # It returns true if the set of vectors are linearly independent.
  def self.are_li?(vectors)
    # First we need to check how many vectors did we get.
    vectors_count = vectors.count
    # One vector is always linearly independent.
    return true if vectors_count == 1
    # All vectors need to have the same dimension.
    raise "Dimension Error: All vectors need to have the same dimension." if vectors.map { |e| e.count }.uniq.count != 1
    # Now we need the dimension of the vectors.
    dimension = vectors[0].count
    # If the dimension of the vectors and the amount of vectors is different
    # We are not going to solve this type of systems.
    raise "Dimension Error: This algorithm does not solve systems with non square matrices." if dimension != vectors_count
    # We need to build the system matrix.
    m = Matrix.build(dimension, dimension) {|row, col| vectors[row][col] }
    if m.det == 0
      false
    else
      true
    end
  end

end

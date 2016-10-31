# Copyright 2016, Juan I. Gesino.
# Licensed under MIT license: https://github.com/juangesino/algebra/blob/master/LICENSE

# This script requires the Matrix Ruby class (https://ruby-doc.org/stdlib-2.2.0/libdoc/matrix/rdoc/Matrix.html)
require 'matrix'

class Algebra

  # Returns the best approximation for an incompatible system ax=b.
  # Where a and b are matrices.
  def self.least_squares(a, b)
    # Make sure the parameters are of class Matrix.
    raise 'Type error: parameters must be from class Matrix' if a.class != Matrix || b.class != Matrix
    # Calculate and return the approximation using projections.
    (a.t * a).inv * a.t * b
  end

end

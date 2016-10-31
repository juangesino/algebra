% Copyright 2016, Juan I. Gesino.
% Licensed under MIT license: https://github.com/juangesino/algebra/blob/master/LICENSE

% Returns the best approximation for an incompatible system ax=b.
% Where a and b are matrices.
function lsq = leastSquares(a, b)
  lsq = pinv(a' * a) * a' * b;
end

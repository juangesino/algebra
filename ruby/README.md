# Ruby Algebra

All of these algorithms and scripts use Ruby, you need to [install ruby](https://www.ruby-lang.org/es/documentation/installation/) to use them.

Methods and algorithms for linear algebra in Ruby:

1. [Gram-Schmidt](#1-gram-schmidt)
2. [Least Squares Method](#2-least-squares-method)
3. [Linear Independence](#3-linear-independence)
4. [Matrices](#4-matrices)
5. [Vector Space Model](#5-vector-space-model)


## 1. Gram-Schmidt

### Introduction

The [Gram–Schmidt process](https://en.wikipedia.org/wiki/Gram%E2%80%93Schmidt_process) is an algorithm for orthonormalising a set of vectors.

This algorithm uses the canonical [dot product](https://en.wikipedia.org/wiki/Dot_product) but can be easily modified by changing the dot product defined in the code.

:warning:

**This script extends the Array class**. It adds some methods like the dot product, norm and subtraction and it also adds methods for orthogonalising and normalising vectors.

If you really would like to use this script for anything other than educational purposes, create a new class that inherits from Array, but don't extend the Array class like I did!

:warning:

### Usage

After installing Ruby, open the [Interactive Ruby Console](https://en.wikipedia.org/wiki/Interactive_Ruby_Shell) by using the command `irb`.

Once in the console you have to load the script:

```ruby
load "gram_schmidt.rb"
```

Now you can call any of the script's methods.

### Examples

Now that you loaded the script, let's use some of the methods.

You can normalize a vector:
```ruby
[1,2,3].normalize
#=> [0.2672612419124244, 0.5345224838248488, 0.8017837257372732]
```

You can find an orthogonal from a vector:
```ruby
[1,2,3].orthogonal([4,5,6])
#=> [1.7142857142857144, 0.4285714285714288, -0.8571428571428568]
```

You can orthogonalize a set of vectors:
```ruby
Array.orthogonals( [ [2,5,4], [1,0,1]  ] )
#=> [[2, 5, 4], [0.7333333333333334, -0.6666666666666666, 0.4666666666666667]]
```

And finally you can orthonormalize a set of vectors using Gram-Schmidt:
```ruby
Array.gram_schmidt( [ [2,5,4], [1,0,1]  ] )
#=> [[0.29814239699997197, 0.7453559924999299, 0.5962847939999439], [0.669438681395203, -0.6085806194501845, 0.42600643361512913]]
```

## 2. Least Squares Method

### Introduction

The [Least Squares Method](https://en.wikipedia.org/wiki/Least_squares) is a method for finding an approximation to incompatible systems.

### Usage

After installing Ruby, open the [Interactive Ruby Console](https://en.wikipedia.org/wiki/Interactive_Ruby_Shell) by using the command `irb`.

Once in the console you have to load the script:

```ruby
load "least_squares.rb"
```

Now you can call the script's method.

### Example

Now that you loaded the script, let's use the method.

The script has a class `Algebra` which has a class method `least_squares` that you can call, passing as parameters the two matrices `a` and `b` from the system: `a x = b`.

For example, if you have the following set of points:

```
(2; 2)
(3; 4)
(4; 3)
```

This translates to a linear system as:

```
2 = 2 m + b
4 = 3 m + b
3 = 4 m + b
```

In matrix form the system is:

```

| 2 1 |           | 2 |
| 3 1 | . | m | = | 4 |
| 4 1 |   | b |   | 3 |

```

Or

```
a x = b
```

Where `a` and `b` are matrices.

Then we can find the best approximation using the least squares method as follows:

First let's create the `a` matrix using the [Matrix](https://ruby-doc.org/stdlib-2.2.0/libdoc/matrix/rdoc/Matrix.html) class from Ruby.
```ruby
a = Matrix[ [2, 1], [3, 1], [4, 1] ]
#=> Matrix[[2, 1], [3, 1], [4, 1]]
```
Now let's create the `b` matrix:
```ruby
b = Matrix[ [2], [4], [3] ]
#=> Matrix[[2], [4], [3]]
```

Finally, to find the approximation we call the class method:

```ruby
Algebra.least_squares(a, b)
#=> Matrix[[(1/2)], [(3/2)]]
```
So for this example:

```
m = 1/2
b = 3/2
```

## 3. Linear Independence

### Introduction

This script checks if a set of vectors are [linearly independent](https://en.wikipedia.org/wiki/Linear_independence).

Right now the algorithm only solves the linear independence when the number of vectors is equal to the dimension of the vectors. This is because the algorithm just solves the determinant of the system of equations. To solve for other set of vectors, the algorithm should implement a way of solving the system for non-square matrices.

### Usage

After installing Ruby, open the [Interactive Ruby Console](https://en.wikipedia.org/wiki/Interactive_Ruby_Shell) by using the command `irb`.

Once in the console you have to load the script:

```ruby
load "linear_independence.rb"
```

Now you can call the script's class method.

### Examples

To find the if a set of vectors is L.I. (linearly independent) or L.D. (linearly dependent):

```ruby
Array.are_li?( [ [1, 0], [0, 1]  ] )
#=> true
```

A returned value of `true` means the vectors are L.I. and a returned value of `false` means they are L.D.

```ruby
Array.are_li?( [ [1, 0], [2, 0]  ] )
#=> false
```

Notice than an error will be raised if the number of vectors differs from the vector's dimension.

```ruby
Array.are_li?( [ [1, 0, 0], [0, 1, 0]  ] )
#=> Dimension Error: This algorithm does not solve systems with non square matrices.
```


## 4. Matrices

### Introduction

This script contains a compilation of methods for matrices.

### Usage

After installing Ruby, open the [Interactive Ruby Console](https://en.wikipedia.org/wiki/Interactive_Ruby_Shell) by using the command `irb`.

Once in the console you have to load the script:

```ruby
load "matrices.rb"
```

Now you can call any of the script's class methods for the class `Algebra`.

Note that when a method requires a matrix as a parameter, the matrix should be given as an array of arrays where each array represents the matrix's columns such as:

```ruby
matrix = [ [a11, a21, ..., an1], [a12, a22, ..., an2], ..., [a1m, a2m, ..., anm] ]
```

### Examples

Now that you loaded the script, let's use some of the methods.

We will define two matrices for these examples:
```ruby
a = [ [2, 1], [3, 1], [4, 1] ]
#=> [[2, 1], [3, 1], [4, 1]]

b = [ [2, 3, 4], [1, 1, 1] ]
#=> [[2, 3, 4], [1, 1, 1]]
```

You can transpose a matrix:
```ruby
Algebra.transpose(a)
#=> [[2, 3, 4], [1, 1, 1]]
```

And you can multiply two matrices:
```ruby
Algebra.multiply_matrices(a, b)
#=> [[29, 9], [9, 3]]
```

## 5. Vector Space Model

### Introduction

The [Vector Space Model](https://en.wikipedia.org/wiki/Vector_space_model) is a way of representing objects as vectors used in indexing and relevancy rankings.

In this case, we find the cosine between two vectors to determine the "similarity" or "closeness" between the two vectors.

:warning:

**This script extends the Array class**. It adds some methods like the dot product and norm.

If you really would like to use this script for anything other than educational purposes, create a new class that inherits from Array, but don't extend the Array class like I did!

:warning:

### Usage

After installing Ruby, open the [Interactive Ruby Console](https://en.wikipedia.org/wiki/Interactive_Ruby_Shell) by using the command `irb`.

Once in the console you have to load the script:

```ruby
load "vector_space_model.rb"
```

Now you can call the script's class method.

### Examples

Now that you loaded the script, let's find some similarities.

Using the method is really simple. We just need to pass two arrays as parameters:

```ruby
Array.similarity([ 1, 0 ], [ 1, 0 ])
#=> "100.0%"
```

Because the two vectors are the same, the similarity is 100%, meaning the cosine is 1 and the angle formed is 0.

Let's try two orthogonal vectors:

```ruby
Array.similarity([ 1, 0 ], [ 0, 1 ])
#=> "0.0%"
```

In this case, the two vectors make an angle of 90°, the cosine is 0 and the similarity is 0%.

Let's take a look at another example:

```ruby
Array.similarity([ 1, 0 ], [ 1, 1 ])
#=> "70.711%"
```

For this example the cosine was 0.70711 which gives an angle of about 45° and thus a similarity of around 70%.

We start to see a problem with this "similarity" as the scale acts a bit strange. Intuition tells us that 45° degrees is halfway between 90° and 0°, so it should be 50% similarity maybe.

Another problem arises when finding the similarity between vectors of same direction but different magnitude:

```ruby
Array.similarity([ 1, 0 ], [ 100, 0 ])
#=> "100.0%"

Array.similarity([ 1, 0 ], [ 2, 0 ])
#=> "100.0%"
```

This method tells us that the three vectors are the same. In reality we know that `[2, 0]` is much "closer" to `[1, 0]` than `[100, 0]`.

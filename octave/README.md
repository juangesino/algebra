# Octave Algebra

All of these algorithms and scripts use Octave, you need to install octave to use them:

[Install Octave for MacOS X.](http://wiki.octave.org/Octave_for_MacOS_X)

[Install Octave for Microsoft Windows.](http://wiki.octave.org/Octave_for_Microsoft_Windows)

[Install Octave for Debian systems.](http://wiki.octave.org/Octave_for_Debian_systems)

Methods and algorithms for linear algebra in Octave:

1. [Least Squares Method](#1-least-squares-method)

## 1. Least Squares Method

### Introduction

The [Least Squares Method](https://en.wikipedia.org/wiki/Least_squares) is a method for finding an approximation to incompatible systems.

### Usage

After installing Octave, open the CLI and navigate to the files directory.

Now you can call the function:

```octave
leastSquares(a, b)
```

### Example

The script has a function `leastSquares` that you can call, passing as parameters the two matrices `a` and `b` from the system: `a x = b`.

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

First let's create the `a` matrix:
```octave
>> a = [2 1; 3 1; 4 1];
```

Now let's create the `b` matrix:
```octave
>> b = [2; 4; 3]
```

Finally, to find the approximation we call the function:

```octave
>> leastSquares(a, b)
ans =

      0.50000
      1.50000
```
So for this example:

```
m = 0.5
b = 1.5
```

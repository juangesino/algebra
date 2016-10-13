# Algebra

Methods and algorithms for linear algebra.

## Gram-Schmidt

### Introduction

The [Gram–Schmidt process](https://en.wikipedia.org/wiki/Gram%E2%80%93Schmidt_process) is an algorithm for orthonormalising a set of vectors.

This algorithm uses the canonical [dot product](https://en.wikipedia.org/wiki/Dot_product) but can be easily modified by changing the dot product defined in the code.

This algorithm uses Ruby, you need to [install ruby](https://www.ruby-lang.org/es/documentation/installation/) to use it.

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

## Contributing

1. Fork it ( https://github.com/juangesino/algebra/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

See [MIT-LICENSE](https://github.com/juangesino/algebra/blob/master/LICENSE)
# Prime Number Multiplication Table

Simple ruby script to print the multiplication table for the first n primes.

The Prime number generator doesn't use "Sieve of Eratosthenes".

## Prerequisites

- ruby 1.9 or higher, assert (gem)

### Installing dependencies

```
$ gem install assert
```

## Running the script

Clone the repository and navigate to its root.

You can either run it as a ruby script or as an executable

### Running as ruby script

```
$ ruby primes_mult_table.rb
```

or

```
$ ruby primes_mult_table.rb 20
```

The number parameter is optional, if not set, the generator assumes a default value of 10.

### Running as executable

We first need to make the file executable using:

```
$ chmod 755 primes_mult_table.rb
```

then to execute it we use:
```
$ ./primes_mult_table.rb
```

or

```
$ ./primes_mult_table.rb 20
```

The number parameter is optional, if not set, the generator assumes a default value of 10.

## Running tests

From root folder run:

```
$ assert prime_tests
```

The tests include a comparison of the bench marks between this script's prime number generator and
ruby's Prime class for different values of n.


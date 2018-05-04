require 'rubygems'
require 'assert'
require 'prime'
require_relative 'primes_generator'

class PrimesTests < Assert::Context

  # Compare prime generation with built in
  # ruby prime class
  def test_prime_generation
    arr = [10, 20, 50, 1000]
    arr.each do |i|
      # assert primes are equal for naive solution
      assert_equal PrimesGenerator.n_primes(i, false),
                  Prime.first(i)
      # assert primes are equal for optimized solution
      assert_equal PrimesGenerator.n_primes(i),
                  Prime.first(i)
    end
  end
end

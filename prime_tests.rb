require 'rubygems'
require 'assert'
require 'prime'
require 'benchmark'
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


  def test_benchmarks
    Benchmark.bm do |bm|
      puts "Naive Prime Generator for n = 10000"
      bm.report{PrimesGenerator.n_primes(10000, false)}

      puts "Optimized Prime Generator for n = 10000"
      bm.report{PrimesGenerator.n_primes(10000)}

      puts "Ruby's Sieve Prime Generator for n = 10000"
      bm.report{Prime.first(10000)}
    end
  end

end

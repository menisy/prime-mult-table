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
      assert_equal PrimesGenerator.n_primes(i),
                  Prime.first(i)
    end
  end


  def test_benchmarks
    Benchmark.bm do |bm|
      puts "My Prime Generator for n = 1000"
      bm.report{PrimesGenerator.n_primes(1000)}
      puts "Ruby's Prime Generator for n = 1000"
      bm.report{Prime.first(1000)}
    end
  end

end

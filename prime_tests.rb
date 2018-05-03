require 'rubygems'
require 'assert'
require 'prime'
require 'benchmark'
require_relative 'primes_generator'

class PrimesTests < Assert::Context

  # Compare prime generation with built in
  # ruby prime class
  def test_prime_generation
    assert_equal PrimesGenerator.n_primes(10),
                  Prime.first(10)
    assert_equal PrimesGenerator.n_primes(20),
                  Prime.first(20)
    assert_equal PrimesGenerator.n_primes(200),
                  Prime.first(200)
  end


  def test_benchmarks
    Benchmark.bm do |bm|
      puts "My Prime Generator"
      bm.report{PrimesGenerator.n_primes(1000)}
      puts "Ruby's Prime Generator"
      bm.report{Prime.first(1000)}
    end
  end

end

#!/usr/bin/env ruby

require_relative 'primes_generator'
require_relative 'benchmarks'

module PrimesMultTable

  def self.generate_table(primes=[])

    n = primes.length
    table = Array.new(n){ Array.new(n) }

    for i in (0...n)
      for j in (i...n)
        mult = primes[i] * primes[j]
        table[i][j], table[j][i] = mult, mult
      end
    end
    table
  end

  def self.print_table(options)
    n = options[:number].to_i

    return puts "Invalid n, please use n > 1" if n < 1

    primes = PrimesGenerator.n_primes(n)
    table = generate_table(primes)

    width = table.flatten.max.to_s.size + 2

    puts "\n"
    puts ([""] + primes).map { |i| i.to_s.rjust(width) }.join
    puts ([""] + primes).map { "_".rjust(width) }.join

    table.each_with_index do |a, indx|
      print(primes[indx].to_s.rjust(width-2) + " |")

      puts a.map { |i| i.to_s.rjust(width) }.join
    end
    puts "\n"

    # print benchmarks if required by options
    if(options[:benchmarks])
        benchmarks(n)
    end
  end
end

require 'optparse'
# Parse command line arguments
options = {}
optparse = OptionParser.new do|opts|

  opts.banner = "Usage: primes_mult_table.rb [options]"


  options[:number] = 10
  opts.on( '-n', '--number Integer', 'Number of primes (integer > 0), default is 10' ) do |number|
    options[:number] = number
  end

  options[:benchmarks] = false
  opts.on( '-b', '--benchmarks', 'Run benchmarks, default is false' ) do
    options[:benchmarks] = true
  end

  opts.on( '-h', '--help', 'Usage and options help' ) do
    puts opts
    exit
  end
end

optparse.parse!

PrimesMultTable.print_table(options)


#!/usr/bin/env ruby

require_relative 'primes_generator'

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

  def self.print_table(arg)
    n = arg ? arg.to_i : 10

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
  end

end


PrimesMultTable.print_table(ARGV[0])
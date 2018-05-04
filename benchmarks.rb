require 'prime'
require 'benchmark'

def benchmarks(n)
  puts("#"*15 + "  Benchmarks  " + "#"*15)
  Benchmark.bm do |bm|
    puts "Naive Prime Generator for n = #{n}"
    bm.report{PrimesGenerator.n_primes(n, false)}

    puts "Optim Prime Generator for n = #{n}"
    bm.report{PrimesGenerator.n_primes(n)}

    puts "Ruby's Prime Generator for n = #{n}"
    bm.report{Prime.first(n)}
  end
end

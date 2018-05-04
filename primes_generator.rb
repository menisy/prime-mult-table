module PrimesGenerator

  FIRST_PRIME = 2

  def self.n_primes(n=10, optimized=true)
    if optimized
      n_primes_opt(n)
    else
      n_primes_naive(n)
    end
  end

  def self.n_primes_naive(n=10)
    # seed primes array with the first prime
    primes = [FIRST_PRIME]
    # init i with first prime
    i = FIRST_PRIME

    # loop until we reach the number of
    # primes needed
    while primes.length < n
      i += 1
      is_prime = true

      # skip if i is even
      next if i % 2 == 0

      # check whether it's divisible by any prime
      for j in (0...primes.length)
        if i % primes[j] == 0
          is_prime = false
          break
        end
      end

      primes << i if is_prime
    end
    primes
  end

    def self.n_primes_opt(n=10)
    # seed primes array with the first prime
    primes = [FIRST_PRIME]
    # init i with first prime
    i = FIRST_PRIME

    # loop until we reach the number of
    # primes needed
    while primes.length < n
      i += 1
      is_prime = true

      # skip if i is even
      next if i % 2 == 0

      sqrt = Math.sqrt(i).to_i

      # check whether it's divisible by any prime
      # smaller than its square root
      for j in (0...sqrt)
        if i % primes[j] == 0
          is_prime = false
          break
        end
      end

      primes << i if is_prime
    end
    primes
  end

end
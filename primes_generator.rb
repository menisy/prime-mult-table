module PrimesGenerator

  FIRST_PRIME = 2

  def self.n_primes(n=10)
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

      # check whether it's devisible by any prime
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

end
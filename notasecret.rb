
def secret(num)
  Math.sqrt(num) # not additive
  #num # additive
end

def all_primes_additive?(num)
  primes = leading_primes(num)

  primes.each do |p1|
    primes.each do |p2|
      return false unless additive?(p1, p2)
    end
  end

  true
end

def additive?(x, y)
  secret(x) + secret(y) == secret(x + y)
end

def leading_primes(num)
  potential_primes = 2..num.to_i
  potential_primes = potential_primes.to_a

  potential_primes.each do |p1|
    potential_primes.each do |p2|
      potential_primes.delete(p2) if p2 % p1 == 0 && p1 != p2
    end
  end

  potential_primes
end

puts all_primes_additive?(ARGV[0])

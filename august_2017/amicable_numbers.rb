require 'mathn'

# Amicable numbers are two different numbers so related that the sum of the proper
# divisors of each is equal to the other number.
# (A proper divisor of a number is a positive factor of that number other than the number itself.
# For example, the proper divisors of 6 are 1, 2, and 3.)

class Integer
  def dsum
    return 1 if self < 2
    pd = prime_division.flat_map{|n,p| [n] * p}
    ([1] + (1...pd.size).flat_map{ |e| pd.combination(e).map{ |f| f.reduce(:*) }}).uniq.inject(:+)
  end
end

def find_d_sum(n)
  n.times.inject do |sum, cur|
    other = cur.dsum
    (cur  != other && other.dsum == cur) ? sum + cur : sum
  end
end


p find_d_sum 10_000

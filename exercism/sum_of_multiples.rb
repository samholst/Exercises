class SumOfMultiples
  attr_reader :factors

  def initialize(*factors)
    @factors = factors
  end

  def to(max)
    (1...max).select { |n| multiple?(n) }.reduce(0, &:+)
  end

  private
  def multiple?(n)
    factors.any? { |factor| n % factor == 0 }
  end
end

sample = SumOfMultiples.new(3, 5).to(1_000)
p sample

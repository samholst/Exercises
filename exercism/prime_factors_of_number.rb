def prime_factors total
  factors = []
  remainder = total
  
  Prime.each(total) do |prime|
    while remainder > 1 do
      if remainder % prime == 0
        factors << prime
        remainder = remainder / prime
      else
        break
      end
    end
  end
  
  factors
end

require 'prime'

describe 'prime factors' do
  it 'returns empty for 1' do
    expect(prime_factors 1).to eq([])
  end

  it 'returns an answer for 4' do
    expect(prime_factors 4).to eq([2, 2])
  end

  it 'returns an answer for 60' do
    expect(prime_factors 60).to eq([2, 2, 3, 5])
  end

  it 'returns an answer for 625' do
    expect(prime_factors 625).to eq([5, 5, 5, 5])
  end

  it 'returns an answer for 901_255' do
    expect(prime_factors 901_255).to eq([5, 17, 23, 461])
  end
end

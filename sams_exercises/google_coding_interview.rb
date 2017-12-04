require 'rspec'

arr = [1,2,3,9]
arr_2 = [1,1,11,334,33,22,2,4,4,15,44,33,10]

def find_sum(num_set, sum)
  comp = []

  num_set.each do |n|
    if comp.include?(n)
      return true
    end
    comp.push(sum - n)
  end
  return false
end

find_sum(arr_2, 27)
# find_sum(arr, 25)


describe 'Find Sum In a Set of Numbers' do
  it 'finds the sum of 25' do
    arr = [1,1,11,334,33,22,2,4,4,15,44,33,10]
    expect(find_sum arr, 25).to eq(true)
  end

  it 'finds the sum 8' do
    arr = [1,1,11,334,33,22,2,4,4,15,44,33,10]
    expect(find_sum arr, 8).to eq(true)
  end

  it 'does not find the sum 16' do
    arr = [1,1,11,334,33,22,2,4,4,15,44,33,10]
    expect(find_sum arr, 27).to eq(false)
  end
end
